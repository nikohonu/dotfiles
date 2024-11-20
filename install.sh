#!/usr/bin/env sh

# Create dirs
mkdir ~/.config
mkdir ~/.config/nvim
mkdir ~/.config/tmux
mkdir ~/.config/zsh
mkdir ~/.config/zsh/env
mkdir ~/.local
mkdir ~/.local/share

# stow
stow arch
stow base
stow git
stow nvim
stow tmux
stow zsh
stow kde
