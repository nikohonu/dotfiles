path+=/home/nikohonu/.local/bin
path+=/home/nikohonu/scripts
export EDITOR=nvim
if [[ $(hostnamectl hostname) == arch0 ]]
then
    export QT_QPA_PLATFORMTHEME=qt5ct
    export GTK_IM_MODULE=ibus
    export QT_IM_MODULE=ibus
    export XMODIFIERS=@im=ibus
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS=@im=fcitx
    if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  	exec startx
    fi
fi
if [[ $(hostnamectl hostname) == arch1 ]]
then
    
fi
