#!/usr/bin/env bash
#
output_image="/tmp/image.webp"
images=()
for arg in "$@"; do
	images+=("$arg")
done
convert +append "${images[@]}" -resize x1080 "$output_image"
nsxiv "$output_image" -f
