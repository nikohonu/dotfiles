#!/bin/sh
current_path=$(pwd)

install() {
	path_in=$current_path/$1
	path_out=$HOME/$1
	parent_path=$(dirname "$path_out")
	echo "ln -sf $path_in $path_out"
	rm -rf "$path_out"
	mkdir -p $parent_path
	ln -s "$path_in" "$path_out"
}

# yay
install .config/yay

# scripts
install scripts

# emacs
install .config/emacs/init.el

# xdg-user-dir
install .config/user-dirs.dirs

# bash
install .bashrc
install .bash_profile

# neovim
install .config/nvim/init.lua
install .config/nvim/lua
install .vsnip

# hyprland
install .config/hypr

# bars
install .config/waybar
install .config/polybar

# mpv
install .config/mpv/input.conf
install .config/mpv/mpv.conf
install .config/mpv/script-opts

# font
install .config/fontconfig

# autostart
install .config/autostart

# bspwm
install .config/bspwm
install .config/sxhkd
