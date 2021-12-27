#!/bin/sh
xset s off -dpms
xset s noblank
# setxkbmap -layout us,ru -option 'grp:caps_toggle'

wallpaper.zsh &
picom --experimental-backends &
/usr/lib/kdeconnectd &
dex /usr/share/applications/org.kde.kdeconnect.nonplasma.desktop &
fcitx -d &
ibus-daemon -drxR &

qbittorrent &
firefox &
telegram-desktop &
