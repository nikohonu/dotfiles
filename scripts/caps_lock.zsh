#!/bin/zsh
CAPS_LOCK=$(xset -q | grep Caps)
CAPS_LOCK=${CAPS_LOCK[22, 24]}
if [[ $CAPS_LOCK = "on " ]]
then
	echo "A"
else
	echo "a"
fi

