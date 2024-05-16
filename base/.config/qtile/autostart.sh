#!/usr/bin/env sh

dex -a &

if [ -z "$WAYLAND_DISPLAY" ]; then
    ~/.fehbg &
else
    kanshi &
    swaybg -i ~/pictures/wallpapers/wallhaven-4gjvl4.png &
fi
