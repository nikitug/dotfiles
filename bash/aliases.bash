#!/bin/bash

alias ls='ls -G'
alias ll='ls -al'
alias l='ls -l'

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=always"
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if [ ! -x "$(which tree)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

alias f5="source ~/.bashrc"

alias .files="cd $DOTFILES"
alias .vim="cd ~/.vim"

alias h="history"
alias hg="h | grep"
