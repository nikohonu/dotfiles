#!/bin/sh
git pull
git add .
date=$(date +"%F %T")
git commit -m "$date"
git push
./install.sh
