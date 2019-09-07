#!/bin/bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

__fzf_history__() (
  shopt -u nocaseglob nocasematch
  ls ~/.bash-history/*.log | tail -n 50 | xargs cat |
    sed 's/.* [0-9][0-9]*  //' | uniq |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac --sync -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd)
)
