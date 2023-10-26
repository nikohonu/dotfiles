#!/usr/bin/env bash

# Define the screenshot folder and name
screenshot_folder=$HOME/pictures/screenshots/$(date +"%Y-%m")
screenshot_name=$screenshot_folder/$(date +"%Y-%m-%dT%H_%M_%S.webp")

# Create the screenshot folder if it doesn't exist
mkdir -p $screenshot_folder

# Check if the script is running on Wayland or Xorg
if [ -z "$WAYLAND_DISPLAY" ]; then
	# If the first argument is "region," capture a region screenshot
	if [ "$1" == "region" ]; then
		maim -s "$screenshot_name"
	else
		maim "$screenshot_name"
	fi
	# Copy the screenshot to the clipboard (Xorg)
	xclip -selection clipboard -t image/webp -i $screenshot_name
else
	# If the first argument is "region," capture a region screenshot
	if [ "$1" == "region" ]; then
		grim -g "$(slurp)" "$screenshot_name"
	else
		grim "$screenshot_name"
	fi
	# Copy the screenshot to the clipboard (Wayland)
	wl-copy <"$screenshot_name"
fi
