#!/bin/bash

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

if $(which tree &>/dev/null)
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

alias f5="source ~/.bashrc"

alias .files="cd $DOTFILES"
alias .vim="cd ~/.vim"

alias hg="history | grep"

if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
else
  alias ls="ls -G"
fi

alias ll="ls -lh"
alias l="ls -lAh"
