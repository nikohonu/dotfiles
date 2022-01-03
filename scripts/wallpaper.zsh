#!/bin/zsh
lock_path="/tmp/lock.png"
wallpapers=(/home/nikohonu/pictures/wallpapers/69f234282e31f8247eef9f52366e412802598bcfa2e53f57f5d2caacc12b3638.jpg /home/nikohonu/pictures/wallpapers/e5711c7f24427683d5c2b3bbed39cd8c850a6eaf8aeebc6f60096085848ecff7.png)

DISPLAY=:0.0 feh --bg-fill ${wallpapers[1]} --bg-fill ${wallpapers[2]}
gm convert ${wallpapers[1]} ${wallpapers[2]} +append $lock_path
