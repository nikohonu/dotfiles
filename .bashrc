#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias grep='rg'
alias ls='exa'
alias orphans='sudo pacman -Qtdq | sudo pacman -Rns -'
alias t='termdown'
alias un7z="7z x"
alias untar="tar -xfv"
alias yt-dlp-channel-as-audiobook='yt-dlp --extract-audio --playlist-reverse -o "%(playlist_index)s - %(title)s.%(ext)s" --compat-option playlist-index'
alias yt-dlp-music="yt-dlp --extract-audio --audio-quality high --embed-thumbnail"

## notes
alias dreams="nvim ~/documents/dreams.md"
alias journal="nvim ~/documents/journal.md"
alias notes="nvim ~/documents/notes.md"

# functions
roll () {
    shuf -i 1-$1 -n 1
}

c () {
    python -c "from math import *; print($1)"
}

open-md () {
    pandoc ~/documents/$1.md --standalone --css ~/documents/style.css --toc=true --metadata title="$1" -o /tmp/$1.html
    xdg-open /tmp/$1.html
}

# PS1
PS1='[\u@\h \W]\$ '

source /home/nikohonu/.bash_completions/fjt.sh
