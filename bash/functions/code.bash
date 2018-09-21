#!/bin/bash

source $DOTFILES/bash/functions/make_dir_complete.bash

function e() {
  if test "$1" == ""
  then
    $EDITOR .
  else
    $EDITOR "$1"
  fi
}

function c() {
  cd $CODE/"$1"
}

make_dir_complete c $CODE
