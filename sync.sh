#!/usr/bin/env sh

git pull
pacman -Qqe >packages.txt
git add packages.txt
git add .
date=$(date +"%F %T")
git commit -m "$date"
git push
./install.sh
