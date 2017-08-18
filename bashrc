# Source default bashrc
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source custom scripts
for script_path in "$HOME/.bash/"{aliases,exports,functions}".bash"; do
    if [ -f "$script_path" ]; then
        . "$script_path"
    fi
done

# Setup powerline
if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bash/powerline.sh
fi

# Activate virtualenvwrapper
if [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]; then
    VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
    . "$HOME/.local/bin/virtualenvwrapper.sh"
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

export TERM=screen-256color
