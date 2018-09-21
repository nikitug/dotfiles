# Nikita's dotfiles

Mostly inspired by holman's dotfiles: https://github.com/holman/dotfiles

## Install

    git clone git://github.com/nikitug/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    make brew symlink

This command will symlink all the `*.symlink` files into your home directory.

## Update

    cd ~/.dotfiles
    git pull origin master
    make brew symlink
