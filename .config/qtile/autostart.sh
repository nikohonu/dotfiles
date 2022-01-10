#!/bin/sh
xset s off -dpms
xset s noblank
setxkbmap -layout us,ru -option 'grp:alt_shift_toggle'

wallpaper.zsh &
picom --experimental-backends &
/usr/lib/kdeconnectd &
dex /usr/share/applications/org.kde.kdeconnect.nonplasma.desktop &

qbittorrent &
firefox &
telegram-desktop &
