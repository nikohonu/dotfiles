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

# bash
install .bashrc
install .bash_profile

# neovim
install .config/nvim/init.lua
install .config/nvim/lua

# font
install .config/fontconfig
