#!/bin/bash

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX="${yellow}"
SCM_THEME_PROMPT_SUFFIX=" "

GIT_THEME_PROMPT_DIRTY="${reset_color} ✗"
GIT_THEME_PROMPT_CLEAN="${reset_color} ✓"
GIT_THEME_PROMPT_PREFIX="${yellow}"
GIT_THEME_PROMPT_SUFFIX=" "

RVM_THEME_PROMPT_PREFIX=""
RVM_THEME_PROMPT_SUFFIX=" "

function prompt_command()
{
  if [ "$(whoami)" = root ]
  then
    user_prompt_char_color=$red
    user_prompt_char="#"
  else
    user_prompt_char_color=$white
    user_prompt_char="$"
  fi

  if [[ $BASH_ENV == "local" ]]
  then
    # no ssh connection, assuming local shell
    location_color=$blue
  else
    # connected by ssh
    location_color=$purple
  fi

  PS1="\t ${location_color}\u@\h ${reset_color}\W${normal} ${yellow}$(scm_prompt_info)${reset_color}${user_prompt_char_color}${user_prompt_char}${normal}${reset_color} "
}

PROMPT_COMMAND=prompt_command;
