#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#   __ _| (_) __ _ ___  ___  ___
#  / _` | | |/ _` / __|/ _ \/ __|
# | (_| | | | (_| \__ \  __/\__ \
#  \__,_|_|_|\__,_|___/\___||___/

# basic
alias ls='eza'
alias grep='rg'

# working with archives
alias un7z="7z x"
alias untar="tar -xfv"

# change the command to disable trash collection
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# yt-dlp
alias yt-dlp-channel-as-audiobook='yt-dlp --extract-audio --playlist-reverse -o "%(playlist_index)s - %(title)s.%(ext)s" --compat-option playlist-index'
alias yt-dlp-music="yt-dlp --extract-audio --audio-quality high --embed-thumbnail"
alias yt-dlp-sub='yt-dlp --write-sub --sub-lang=en,ja'

# package manager
alias orphans='sudo pacman -Qtdq | sudo pacman -Rns -'

# useful programs
alias t='task'
alias td='termdown'

#   __                  _   _
#  / _|_   _ _ __   ___| |_(_) ___  _ __  ___
# | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/

# useful functions
roll() {
	shuf -i 1-$1 -n 1
}
c() {
	python -c "from math import *; print($1)"
}

#                            _      _   _
#   ___ ___  _ __ ___  _ __ | | ___| |_(_) ___  _ __  ___
#  / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \/ __|
# | (_| (_) | | | | | | |_) | |  __/ |_| | (_) | | | \__ \
#  \___\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|___/
#                     |_|

for bcfile in $XDG_CONFIG_HOME/bash/completions/*; do
	. $bcfile
done

#            _
#  _ __  ___/ |
# | '_ \/ __| |
# | |_) \__ \ |
# | .__/|___/_|
# |_|

function format_git_branch() {
	local branches=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
	if [ -n "$branches" ]; then
		branches=" ${branches}"
	fi
	echo "$branches"
}
PS1='\[\e[96;1m\]ましろ \[\e[0m\][\t] \[\e[92m\]\w\[\e[93;1m\]$(format_git_branch)\[\e[0m\]\\$ '
