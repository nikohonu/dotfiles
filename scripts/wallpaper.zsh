#!/bin/zsh
lock_path="/tmp/lock.png"
wallpapers=(/home/nikohonu/pictures/wallpapers/61c385cb3d55730fe357f478b62ebbcf6bd59c0d4d3ac42ad8f838c6312f1178.png /home/nikohonu/pictures/wallpapers/aa002cbedd2ef389aea60a88f7637870b983f5e62d454d757d507ef245197949.png)

DISPLAY=:0.0 feh --bg-fill ${wallpapers[1]} --bg-fill ${wallpapers[2]}
gm convert ${wallpapers[1]} ${wallpapers[2]} +append $lock_path
