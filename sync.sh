#!/usr/bin/env sh

git pull
# ./pacman.sh
git add packages.txt
git add .
date=$(date +"%F %T")
git commit -m "$date"
git push
./install.sh
