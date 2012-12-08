#!/bin/bash

# Aliases
alias g='git'

# add
alias ga='git add'

# status
alias gs='git status'
alias gss='git status -s'

# pull/fetch
alias gf='git fetch'
alias gu='git pull'
alias gur='git pull --rebase'
alias guroc='git pull --rebase origin `gb | grep ^* | cut -d" " -f2`'

# push
alias gp='git push'
alias gpo='git push origin'

# commit
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gci='git commit --interactive'

# merge
alias gm='git merge --no-ff'
alias gmff='git merge'

# branch
alias gb='git branch'
alias gba='git branch -a'
alias gbdel='git branch -D'

# diff
alias gd='git diff'
alias gdv='git diff -w "$@" | vim -R -'
alias gd1='echo "git diff HEAD";  git diff HEAD'
alias gd2='echo "git diff HEAD^"; git diff HEAD^'

# log
alias gl='git log'
alias glt='git log --graph --pretty=oneline --abbrev-commit'

# Git submodule shortcuts
alias gsa='git submodule add'
alias gsu='git submodule update --init'

# Git svn shortcuts
alias gsf='git svn fetch'
alias gsfr='git svn fetch && git svn rebase'
alias gsdc='git svn dcommit --add-author-from --use-log-author'
alias gssy='gsfr && gsdc'

alias gcount='git shortlog -sn'
alias gexport='git archive --format zip --output'
alias grmall="git status | grep 'deleted:' | awk '{print \$3}' | xargs git rm -f"
alias gco='git checkout'
