#!/bin/bash

alias cask='brew cask'
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias g='git'
alias grep='grep --color=auto'
alias map='xargs -n1'
alias reload='exec $SHELL -l'
alias rmds='find . -name "*.DS_Store" -exec rm -rf {} \;'
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias dockerkillall='docker kill $(docker ps -q)'
alias dockercleani='docker image rm -f $(docker image ls -q -f dangling=true)'
