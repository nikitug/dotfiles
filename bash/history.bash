#!/bin/bash

# append to bash_history if Terminal.app quits
shopt -s histappend

# history handling
#
# Erase duplicates
# Bash History
export HISTCONTROL="ignoredups"
export HISTCONTROL=erasedups

# resize history size
export HISTSIZE=5000

export AUTOFEATURE=true autotest

function history_count {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

mkdir -p ~/.bash-history

function store_history {
  if [ "$(id -u)" -ne 0 ]
  then
    echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.bash-history/$(date "+%Y-%m-%d").log
  fi
}
