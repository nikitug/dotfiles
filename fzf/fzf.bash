#!/bin/bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

__fzf_history__() {
  shopt -u nocaseglob nocasematch
  local output
  output=$(
    ls ~/.bash-history/*.log | tail -n 200 | xargs cat | sort | grep -E '^\d{4}-\d{2}-\d{2}' |
      sed 's/.* [0-9][0-9]*  //' | uniq |
      FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac --sync --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd) --query "$READLINE_LINE"
  ) || return
  READLINE_LINE=${output#*$'\t'}
  if [ -z "$READLINE_POINT" ]; then
    echo "$READLINE_LINE"
  else
    READLINE_POINT=0x7fffffff
  fi
}
