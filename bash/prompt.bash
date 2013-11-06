#!/bin/bash

source $DOTFILES/bash/colors.bash

prompt_git_info () {
 ref=$(/usr/bin/git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

prompt_git_dirty() {
  st=$(/usr/bin/git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo ""
  else
    if [[ $st == "nothing to commit, working directory clean" ]]
    then
      echo " on ${green}$(prompt_git_info)${reset_color}"
    else
      echo " on ${red}$(prompt_git_info)${reset_color}"
    fi
  fi
}

prompt_git_unpushed () {
  /usr/bin/git cherry -v @{upstream} 2>/dev/null
}

prompt_need_push () {
  if [[ $(prompt_git_unpushed) == "" ]]
  then
    echo ""
  else
    echo " ${purple}unpushed${reset_color}"
  fi
}

prompt_ruby() {
  if $(which rbenv &> /dev/null)
  then
    echo " ${normal}$(rbenv version | awk '{print $1}')${reset_color}"
  elif $(which rvm &> /dev/null)
  then
    echo " ${normal}$(rvm tools identifier)${reset_color}"
  else
    echo ""
  fi
}

prompt_directory_name() {
  echo "${cyan}\w${reset_color}"
}

set_prompt() {
  if [[ -n $SSH_CONNECTION ]]; then
    PS1="\u@\h $(prompt_directory_name) ϟ "
  else
    PS1="$(prompt_directory_name)$(prompt_git_dirty)$(prompt_need_push)$(prompt_ruby)\n› "
  fi
}

PROMPT_COMMAND=set_prompt
