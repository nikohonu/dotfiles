#!/usr/bin/env bash

while true; do
	PID=$(pidof swaybg)
	swaybg -i $(find ~/pictures/wallpapers/random/. -type f | shuf -n1) &
	sleep 1
	kill $PID
	sleep 599
done
