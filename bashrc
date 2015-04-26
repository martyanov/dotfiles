# Aliases
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias E="SUDO_EDITOR=\"emacsclient -t\" sudoedit"
alias e='emacsclient -t'
alias ec='emacsclient -c'

# Local executable path
export PATH=$PATH:$HOME/.local/bin

# Pretty terminal
export TERM=xterm-256color

# Python
export PYTHONDONTWRITEBYTECODE=1
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

# Powerline
if [ -f $HOME/.powerline/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . $HOME/.powerline/powerline/bindings/bash/powerline.sh
fi

# Go
export GOPATH=$HOME/usr/go
export GOROOT=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# OPAM
. /home/andrey/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true