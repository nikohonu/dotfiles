#!/bin/zsh
DOTFILES=$(realpath $(dirname "$0"))

install () {
    FILE="$DOTFILES/$1"
    DEST="$HOME/$1"
    printf "from $FILE to $DEST\n"
    rm -rf $DEST
    ln -s $FILE $DEST
}

install .zshrc 
install .zprofile
install scripts

if [[ $(hostnamectl hostname) == arch0 ]]
then
    install .xinitrc
    install .config/qtile
fi

if [[ $(hostnamectl hostname) == arch1 ]]
then
fi
