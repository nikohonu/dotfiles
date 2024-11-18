#!/usr/bin/env sh

pacman -Qqe > packages.txt

sed -i '/nvidia/d' packages.txt
sed -i '/cuda/d' packages.txt
sed -i '/xf86-video-amdgpu/d' packages.txt
sed -i '/xf86-video-ati/d' packages.txt
sed -i '/lib32-vulkan-radeon/d' packages.txt
sed -i '/vulkan-radeon/d' packages.txt
