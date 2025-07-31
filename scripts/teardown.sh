#!/bin/bash

stow -D --dir=~/.dotfiles --target=~/

if [ -z $(la -A '~/.local/share/nvim') ] then
    rm -rf '~/.local/share/nvim'
fi

if [ -z $(la -A '~/.config') ] then
    rm -rf '~/.config'
fi
