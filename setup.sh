#!/bin/bash

mkdir -p ~/.local/share/nvim
mkdir -p ~/.config

if [ ! $(which stow) ]; then
    sudo apt install stow
fi

stow --dotfiles .
