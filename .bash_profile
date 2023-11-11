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
set_path ~/.cargo/bin ~/.local/bin ~/scripts ~/.scripts ~/.yarn/bin ~/.config/emacs/bin

# general
export EDITOR=nvim

# japanese
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

# wayland
export MOZ_ENABLE_WAYLAND=1
export OBSIDIAN_USE_WAYLAND=1
export ANKI_WAYLAND=1
