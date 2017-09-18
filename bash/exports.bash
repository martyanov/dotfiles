#!/bin/bash

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Setup general executable file paths
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Pretty terminal colors
export TERM=screen-256color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# History
shopt -s histappend
export HISTSIZE=65535
export HISTFILESIZE=65535
export HISTCONTROL=ignoredups

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Python
export PYTHONDONTWRITEBYTECODE=1
export PYTHONIOENCODING=UTF-8

# Haskell
export PATH="$PATH:$HOME/.cabal/bin"

# Vagrant
export VAGRANT_DEFAULT_PROVIDER="virtualbox"
