#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

set_path() {
    [ "$(id -u)" -ge 1000 ] || return
    for i in "$@";
    do
        [ -d "$i" ] || continue
        echo "$PATH" | grep -Eq "(^|:)$i(:|$)" && continue
        export PATH="${PATH}:$i"
    done
}

# path
set_path ~/.cargo/bin ~/.local/bin ~/scripts

# general
export EDITOR=nvim

# japanese
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

# themes
export QT_QPA_PLATFORMTHEME=qt6ct

# startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
