#!/bin/bash

black="\[\e[0;30m\]"
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
purple="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
white="\[\e[1;37m\]"
orange="\[\e[33;40m\]"

bold_black="\[\e[1;30m\]"
bold_red="\[\e[1;31m\]"
bold_green="\[\e[1;32m\]"
bold_yellow="\[\e[1;33m\]"
bold_blue="\[\e[1;34m\]"
bold_purple="\[\e[1;35m\]"
bold_cyan="\[\e[1;36m\]"
bold_white="\[\e[1;37m\]"
bold_orange="\[\e[1;33;40m\]"

underline_black="\[\e[4;30m\]"
underline_red="\[\e[4;31m\]"
underline_green="\[\e[4;32m\]"
underline_yellow="\[\e[4;33m\]"
underline_blue="\[\e[4;34m\]"
underline_purple="\[\e[4;35m\]"
underline_cyan="\[\e[4;36m\]"
underline_white="\[\e[4;37m\]"
underline_orange="\[\e[4;33;40m\]"

background_black="\[\e[40m\]"
background_red="\[\e[41m\]"
background_green="\[\e[42m\]"
background_yellow="\[\e[43m\]"
background_blue="\[\e[44m\]"
background_purple="\[\e[45m\]"
background_cyan="\[\e[46m\]"
background_white="\[\e[47m\]"

normal="\[\e[00m\]"
reset_color="\[\e[39m\]"

THEME_PROMPT_HOST='\H'
SCM_THEME_PROMPT_DIRTY=' ✗'
SCM_THEME_PROMPT_CLEAN=' ✓'
SCM_THEME_PROMPT_PREFIX=' |'
SCM_THEME_PROMPT_SUFFIX='|'

GIT='git'
SCM_GIT_CHAR='±'

HG='hg'
SCM_HG_CHAR='☿'

SVN='svn'
SCM_SVN_CHAR='⑆'

SCM_NONE_CHAR='○'

RVM_THEME_PROMPT_PREFIX=' |'
RVM_THEME_PROMPT_SUFFIX='|'

VIRTUALENV_THEME_PROMPT_PREFIX=' |'
VIRTUALENV_THEME_PROMPT_SUFFIX='|'

function scm {
  if [[ -d .git ]]; then SCM=$GIT
  elif [[ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]]; then SCM=$GIT
  elif [[ -d .hg ]]; then SCM=$HG
  elif [[ -n "$(hg root 2> /dev/null)" ]]; then SCM=$HG
  elif [[ -d .svn ]]; then SCM=$SVN
  else SCM='NONE'
  fi
}

function scm_char {
  if [[ -z $SCM ]]; then scm; fi
  [[ $SCM == $GIT ]] && echo $SCM_GIT_CHAR && return
  [[ $SCM == $HG ]] && echo $SCM_HG_CHAR && return
  [[ $SCM == $SVN ]] && echo $SCM_SVN_CHAR && return
  echo $SCM_NONE_CHAR
}

function scm_prompt_info {
  if [[ -z $SCM ]]; then scm; fi
  [[ $SCM == $GIT ]] && git_prompt_info && return
  [[ $SCM == $HG ]] && hg_prompt_info && return
  [[ $SCM == $SVN ]] && svn_prompt_info && return
}

# Stolen from Steve Losh
# left in for backwards-compatibility
function prompt_char {
    char=$(scm_char);
    echo -e "$char"
}

function git_prompt_info {
  if [[ -n $(git status -s 2> /dev/null |grep -v ^# |grep -v "working directory clean") ]]; then
      state=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
  else
      state=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  fi
  prefix=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  suffix=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

  echo -e "$prefix${ref#refs/heads/}$state$suffix"
}

function svn_prompt_info {
  if [[ -n $(svn status 2> /dev/null) ]]; then
      state=${SVN_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
  else
      state=${SVN_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  fi
  prefix=${SVN_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  suffix=${SVN_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
  ref=$(svn info 2> /dev/null | awk -F/ '/^URL:/ { for (i=0; i<=NF; i++) { if ($i == "branches" || $i == "tags" ) { print $(i+1); break }; if ($i == "trunk") { print $i; break } } }') || return

  [[ -z $ref ]] && return
  echo -e "$prefix$ref$state$suffix"
}

function hg_prompt_info() {
    if [[ -n $(hg status 2> /dev/null) ]]; then
        state=${HG_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
    else
        state=${HG_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
    fi
    prefix=${HG_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
    suffix=${HG_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
    branch=$(hg summary 2> /dev/null | grep branch | awk '{print $2}')
    changeset=$(hg summary 2> /dev/null | grep parent | awk '{print $2}')

    echo -e "$prefix$branch:${changeset#*:}$state$suffix"
}

function rvm_version_prompt {
  if which rvm &> /dev/null; then
    rvm=$(rvm tools identifier) || return
    echo -e "$RVM_THEME_PROMPT_PREFIX$rvm$RVM_THEME_PROMPT_SUFFIX"
  fi
}

function virtualenv_prompt {
  if which virtualenv &> /dev/null; then
    virtualenv=$([ ! -z "$VIRTUAL_ENV" ] && echo "`basename $VIRTUAL_ENV`") || return
    echo -e "$VIRTUALENV_THEME_PROMPT_PREFIX$virtualenv$VIRTUALENV_THEME_PROMPT_SUFFIX"
  fi
}

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
    user_prompt_char="→"
  fi

  location_color=$blue

  #if [[ $BASH_ENV == "local" ]]
  #then
    ## no ssh connection, assuming local shell
    #location_color=$blue
  #else
    ## connected by ssh
    #location_color=$purple
  #fi

  prompt_underline="${black}${underline_black}                                       ${reset_color}${normal}"

  PS1="$(date "+%Y-%m-%d") \t ${location_color}\u@\h ${reset_color}in ${background_black}\w${normal}\n${yellow}$(scm_prompt_info)${reset_color}${user_prompt_char_color}${user_prompt_char}${normal}${reset_color} "
}

PROMPT_COMMAND=prompt_command;
