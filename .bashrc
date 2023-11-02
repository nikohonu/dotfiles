#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias ls='exa'
alias grep='grep --color=auto'
alias orphans='sudo pacman -Qtdq | sudo pacman -Rns -'
alias t='termdown'
alias un7z="7z x"
alias untar="tar -xfv"
alias yt-dlp-music="yt-dlp --extract-audio --audio-quality high --embed-thumbnail"
alias yt-dlp-channel-as-audiobook='yt-dlp --extract-audio --playlist-reverse -o "%(playlist_index)s - %(title)s.%(ext)s" --compat-option playlist-index'

# functions
roll () {
    shuf -i 1-$1 -n 1
}

c () {
    python -c "from math import *; print($1)"
}

# PS1
PS1='[\u@\h \W]\$ '

source /home/nikohonu/.bash_completions/fjt.sh
