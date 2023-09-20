#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias orphans='sudo pacman -Qtdq | sudo pacman -Rns -'
alias c='task calc'
alias un7z="7z x"
alias untar="tar -xfv"
alias random_task="task | tail -n +4 | head -n -2 | shuf -n 1"
alias yt-dlp-music="yt-dlp --extract-audio --audio-quality high --embed-thumbnail"
alias yt-dlp-channel-as-audiobook='yt-dlp --extract-audio --playlist-reverse -o "%(playlist_index)s - %(title)s.%(ext)s" --compat-option playlist-index'
# tmux kill-server

# functions
roll () {
    shuf -i 1-$1 -n 1
}

# PS1
PS1='[\u@\h \W]\$ '
