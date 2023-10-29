#!/usr/bin/env bash
x=$(cut -d',' -f1 <<< $(hyprctl cursorpos))
y=$(($(cut -d',' -f2 <<< $(hyprctl cursorpos)) - 30))
wofi --show drun -x $x -y $y
