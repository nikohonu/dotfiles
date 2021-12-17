#!/bin/zsh
DOTFILES=$(realpath $(dirname "$0"))
echo $DOTFILES

install () {
    FILE="$DOTFILES/$1"
    DEST="$HOME/$1"
    printf "from $FILE to $DEST\n"
    rm -rf $DEST
    ln -s $FILE $DEST
}

install .zshrc 
install .zprofile

if [[ $(hostnamectl hostname) == arch0 ]]
then
    install .xinitrc
fi

if [[ $(hostnamectl hostname) == arch1 ]]
then
fi