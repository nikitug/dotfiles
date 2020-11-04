#!/bin/bash

alias ga='git add'
alias gs='git status -sb'
alias gam="git status | grep 'modified:' | awk '{print \$2}' | xargs git add"
alias grmall="git status | grep 'deleted:' | awk '{print \$2}' | xargs git rm -f"
alias gco='git checkout'

alias gamend="git status | grep 'modified:' | awk '{print \$2}' | xargs git add && git amend"

# pull/fetch
alias gu='git pull origin --autostash $(git branch --show-current)'
alias gf='git fetch'
alias master='gco master'

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
alias gbclean='git branch --merged | command grep -vE "^(\*|\s*master\s*$)" | command xargs -n 1 git branch -d'

# diff
alias gd='git diff --color-words'
alias gd1='echo "git diff HEAD";  git diff HEAD'
alias gd2='echo "git diff HEAD^"; git diff HEAD^'

# log
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr, %C(cyan dim)%cD%C(green no-dim))%Creset' --abbrev-commit --date=relative"
