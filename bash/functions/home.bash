#!/bin/bash

source $DOTFILES/bash/functions/make_dir_complete.bash

function h() {
  cd "$HOME/$1"
}

make_dir_complete h $HOME
