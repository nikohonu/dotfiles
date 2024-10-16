#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# aliases
alias orphans='sudo pacman -Qtdq | sudo pacman -Rns -'
alias clear="printf '\033[2J\033[3J\033[1;1H'"

# working with archives
alias un7z="7z x"
alias untargz="tar -xvzf"
alias unzip_jp="unzip -O shift-jis"

# yt-dlp
alias yt-dlp-channel-as-audiobook='yt-dlp --extract-audio --playlist-reverse -o "%(playlist_index)s - %(title)s.%(ext)s" --compat-option playlist-index'
alias yt-dlp-music="yt-dlp --extract-audio --audio-quality high --embed-thumbnail"
alias yt-dlp-sub='yt-dlp --write-sub --write-auto-subs --sub-lang=en,ja --output "%(upload_date)s-%(title)s.%(ext)s"'
alias yt-dlp-playlist-audio='yt-dlp --output "%(upload_date)s-%(title)s.%(ext)s" --extract-audio'
alias yt-dlp-playlist='yt-dlp --output "%(upload_date)s-%(title)s.%(ext)s"'
alias yt-dlp-720p="yt-dlp -f 'bestvideo[height<=720]+bestaudio/best[height<=720]'"
alias yt-dlp-720p-playlist="yt-dlp -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' -o '%(playlist_index)s - %(title)s.%(ext)s'"

# other
alias lute="~/.venv/bin/python -m lute.main"

# python
alias pip="~/.venv/bin/pip"
alias py="~/.venv/bin/python"

# useful functions
roll() {
	shuf -i 1-$1 -n 1
}

c () {
    python -c "import math; print($1)"
}

split-video() {
    ffmpeg -i "$1" -c copy -map 0 -segment_time 00:$2:00 -f segment -reset_timestamps 1 "${1%.*}%03d.${1##*.}"
}

icon-extract() {
    wrestool -x -t 14 "$1" > output.ico; magick convert output.ico output.png; rm output.ico 
}

sub-clear() {
    ffmpeg -i "$1" tmp.srt
    srt process -m re -f 'lambda sub: re.sub("<[^<]+?>", "", sub)' -i tmp.srt -o "${1%.mkv}.en.srt"
    rm tmp.srt
}


PS1='[\u@\h \W]\$ '

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
