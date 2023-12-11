#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

pathedit() {
	[ -z "$2" ] && return 2
	PATH=$(printf ":$PATH:" | sed "s:\:$2\::\::g")
	case $1 in
	-p) PATH=$2$PATH ;;
	-a) PATH=$PATH$2 ;;
	-r) ;;
	*) return 2 ;;
	esac
	PATH=$(printf "$PATH" | tr -s :) PATH=${PATH#:} PATH=${PATH%:}
}

# path
pathedit -a ~/.local/bin
pathedit -a ~/.local/share/cargo/bin
pathedit -a ~/.scripts
pathedit -a ~/.yarn/bin
pathedit -a ~/Scripts

# xdg
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# general
export LANG=en_US.UTF-8
export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt6ct

# japanese
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

# rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# other
export WINEPREFIX="$XDG_DATA_HOME"/wine
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

rm -fr ~/.cache/sessions/*

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
