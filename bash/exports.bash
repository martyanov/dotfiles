#!/bin/bash

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Setup general executable file paths
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Pretty terminal colors
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Pretty man pages
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

# History
shopt -s histappend
export HISTSIZE=65535
export HISTFILESIZE=65535
export HISTCONTROL=ignoredups

# Go
if [[ -n $(command -v go) ]]; then
    export GO111MODULE="on"
    GOPATH=$(go env GOPATH)
    if [[ -n $GOPATH && -d $GOPATH/bin ]]; then
        export PATH="$PATH:$GOPATH/bin"
    fi
fi

# Python
export PYTHONDONTWRITEBYTECODE=1
export PYTHONIOENCODING=UTF-8

# GPG
GPG_TTY=$(tty)
export GPG_TTY
