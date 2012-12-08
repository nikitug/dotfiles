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
  dir=$PROJECTS/"$1"
  [ ! -d $dir ] && mkdir -p $dir
  cd $dir
}

function ce() {
  c "$1"
  e .
}

make_dir_complete c $PROJECTS
make_dir_complete ce $PROJECTS
