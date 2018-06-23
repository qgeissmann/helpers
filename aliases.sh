alias ll='ls -alhF --color=auto -F'
alias la='ls -A'
alias l='ls -CF --color=auto'


alias cdd='cd ~/Desktop'
alias cdt='cd /tmp'
alias cdc='cd ~/comput/'
alias cdo='cd ~/ownCloud/'
alias cdr='cd ~/comput/rethomics/'
alias cde='cd ~/comput/ethoscope-git'
alias cdh='cd ~/comput/helpers-git'
alias cdp='cd ~/comput/ImperialPhD/PhD/phd_thesis'
alias x='xdg-open'
alias pmake='time nice make -j$NUMCPUS --load-average=$NUMCPUS'
alias yuy='echo "Running yaourt -Syua" && yaourt -Syua'
alias grep='grep --color=auto'
alias mplayer='mplayer -fs'
alias switch_gpu='sudo sh ~/comput/helpers-git/switch_gpu.sh'
#see curseradio to gegt the url
alias bbc4='mpv http://open.live.bbc.co.uk/mediaselector/5/select/version/2.0/mediaset/http-icy-mp3-a/vpid/bbc_radio_fourlw/format/pls.pls'

alias commit='git commit'
alias pull='git pull --recurse-submodules'
alias push='git push'
alias defselect='gnome-terminal -e "$(sdcv $(xclip -o -sec) -n -0)"'
echo " "
echo "==========================="
echo 'Your aliases:'
alias
echo "==========================="
