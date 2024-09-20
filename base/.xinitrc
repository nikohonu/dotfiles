#!/usr/bin/env sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# xdg autostart
dex -a &

# programs autostart
dunst &
playerctld &

# scripts autostart
bar.sh &

# scripts autostart (full path)
~/.fehbg

# run dwm
exec dwm.sh
