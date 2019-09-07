#!/bin/bash

# Bundler Commands
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bu="bundle update"

alias rcop='be rubocop $(git ls-files -m | xargs ls -1 2>/dev/null | grep "\.rb$")'
alias ctags-ruby='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'
