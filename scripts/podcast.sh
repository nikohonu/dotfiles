#!/usr/bin/env bash

PODCAST_PATH=~/audiobooks/podcasts
mkdir -p $PODCAST_PATH
cd $PODCAST_PATH
 yt-dlp -o "%(upload_date)s - %(title)s%(ext)s" "$1" -x --audio-format opus --audio-quality 32k --sponsorblock-remove all
TOTAL_DUARTION=0
for file in $PODCAST_PATH/*.opus; do
    duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$file")
    TOTAL_DUARTION=$(bc -l <<< "$TOTAL_DUARTION+$duration")
done
echo "Total duration is $(date -u -d "@$TOTAL_DUARTION" +'%T')"

