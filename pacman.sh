#!/usr/bin/env sh

pacman -Qqe > packages.txt

sed -i '/nvidia/d' packages.txt
sed -i '/cuda/d' packages.txt
sed -i '/xf86-video-amdgpu/d' packages.txt
sed -i '/xf86-video-ati/d' packages.txt
