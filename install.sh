#!/usr/bin/env sh

# Create dirs
mkdir ~/.config
mkdir ~/.config/zsh
mkdir ~/.config/zsh/env
mkdir ~/.config/tmux

# stow
stow arch
stow base
stow git
stow nvim
stow tmux
stow zsh
