#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.private ]] && . ~/.private

export PATH=~/bin:~/.local/bin/:~/.cargo/bin:~/apps/flutter/bin/:~./node_modules/.bin:$PATH

export EDITOR=nvim

export TERMINAL=foot

# export ANDROID_HOME=~/apps/sdk

# export QT_QPA_PLATFORMTHEME=qt6ct
# export GTK_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx
# export QT_IM_MODULE=fcitx
# export SDL_IM_MODULE=fcitx
# export GLFW_IM_MODULE=ibus
# export HF_HUB_ENABLE_HF_TRANSFER=1
# export SDL_VIDEO_DRIVER=wayland # this like broke steam, fuck
# export ELECTRON_OZONE_PLATFORM_HINT=auto


if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec Hyprland
fi
#
# if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 3 ]; then
#   export XMODIFIERS=@im=fcitx
#   export GTK_IM_MODULE=fcitx
#   export QT_IM_MODULE=fcitx
#   export SDL_IM_MODULE=fcitx
#   export GLFW_IM_MODULE=ibus
#   exec startx
# fi
#
