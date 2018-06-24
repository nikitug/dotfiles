#!/bin/bash

# Bundler Commands
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bu="bundle update"

# Rails Commands
alias r='rails'
alias rg='rails g'
alias rs='rails s'
alias rc='rails c'
alias rdbm='rake db:migrate'

alias ctags-ruby='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'
