#!/bin/sh
git pull
pacman -Qe >packages.txt
git add packages.txt
# git add .
date=$(date +"%F %T")
git commit -m "$date"
git push
./install.sh
