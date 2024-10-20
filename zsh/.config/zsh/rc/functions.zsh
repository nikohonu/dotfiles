#!/usr/bin/env zsh

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

