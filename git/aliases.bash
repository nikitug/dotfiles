#!/bin/bash

alias ga='git add'
alias gs='git status -sb'
alias grmall="git status | grep 'deleted:' | awk '{print \$2}' | xargs git rm -f"
alias gco='git checkout'

# pull/fetch
alias gf='git fetch'
alias gu='git pull'
alias gur='git pull --rebase'
alias guroc='git pull --rebase origin `gb | grep ^* | cut -d" " -f2`'

# push
alias gp='git push origin HEAD'

# commit
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gci='git commit --interactive'

# merge
alias gm='git merge --no-ff'
alias gmff='git merge'
alias gmt='git mergetool -t vimdiffconflicts'
alias gmtm='git mergetool -t mvimdiffconflicts'

# branch
alias gb='git branch'
alias gba='git branch -a'
alias gbdel='git branch -D'

# diff
alias gd='git diff'
alias gd1='echo "git diff HEAD";  git diff HEAD'
alias gd2='echo "git diff HEAD^"; git diff HEAD^'

# log
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Git submodule shortcuts
alias gsa='git submodule add'
alias gsu='git submodule update --init'

# Git svn shortcuts
alias gsf='git svn fetch'
alias gsfr='git svn fetch && git svn rebase'
alias gsdc='git svn dcommit --add-author-from --use-log-author'
alias gssy='gsfr && gsdc'
