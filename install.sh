#!/usr/bin/env sh

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

# zsh
install .p10k.zsh
install .zprofile
install .zshenv
install .zshrc

# font config
install .config/emacs/config.org
install .config/emacs/init.el

# font config
install .config/fontconfig/conf.d/99-japanese-fonts.conf
