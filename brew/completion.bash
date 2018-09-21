#!/bin/bash

if which brew >/dev/null 2>&1; then
  if [ -f `brew --prefix`/etc/bash_completion.d ]; then
    . `brew --prefix`/etc/bash_completion.d/*
  fi

  if [ -f `brew --prefix`/Homebrew/completions/bash/brew ]; then
    . `brew --prefix`/Homebrew/completions/bash/brew
  fi
fi
