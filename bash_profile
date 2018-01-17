echo Welcome on '"'$HOSTNAME'"'

RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"
 
PS_LINE=`printf -- '- %.0s' {1..200}`
function parse_git_branch {
  PS_BRANCH=''
  PS_FILL=${PS_LINE:0:$COLUMNS}
  if [ -d .svn ]; then
    PS_BRANCH="(svn r$(svn info|awk '/Revision/{print $2}'))"
    return
  elif [ -f _FOSSIL_ -o -f .fslckout ]; then
    PS_BRANCH="(fossil $(fossil status|awk '/tags/{print $2}')) "
    return
  fi
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  PS_BRANCH="(git ${ref#refs/heads/}) "
}
PROMPT_COMMAND=parse_git_branch
PS_INFO="$GREEN\u@\h$RESET:$BLUE\w"
PS_GIT="$YELLOW\$PS_BRANCH"
PS_TIME="\[\033[\$((COLUMNS-10))G\] $RED[\t]"
export PS1="\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}${PS_TIME}\n${RESET}\$ "


#color the prompt
#'PS1='[\u@\h \W]\$ '
#'PS1='\[\e[0;36m\]\u@\h\[\e[m\]\[\e[1;34m\] | \w |\[\e[m\]\[\e[1;32m\] |;-) >\[\e[m\] '
# don't put duplicate lines in the history. See bash(1) for more options# ... or force ignoredups and ignorespace



# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=200000
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoreboth
HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="&:ls:[bf]g:exit"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Variables##################################################################

#Defines the variable NUMCPUS: the number of CPUS
export NUMCPUS=`grep -c '^processor' /proc/cpuinfo`

export LD_LIBRARY_PATH=/usr/local/lib
# Aliases##################################################################

source aliases.sh

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh



PATH=$PATH:~/.gem/ruby/2.3.0/bin/
#PATH=$PATH:~/.gem/ruby/2.3.0/bin/:~/.Renv/bin
#eval "$(Renv init -)"
