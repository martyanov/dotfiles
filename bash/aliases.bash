#!/bin/bash

alias e='emacsclient -t'
alias g='git'
alias grep='grep --color=auto'
alias map='xargs -n1'
alias reload='exec $SHELL -l'
alias lsrpmkeys='rpm -q gpg-pubkey --qf "%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n"'
