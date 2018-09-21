#!/bin/bash

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias f5="source ~/.bashrc"

alias .files="cd $DOTFILES"
alias .vim="cd ~/.vim"

if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
else
  alias ls="ls --color"
fi

alias ll="ls -lh"
alias l="ls -lAh"
