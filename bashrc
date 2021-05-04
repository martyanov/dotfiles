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

# Setup starship
eval "$(starship init bash)"

# Activate virtualenvwrapper
if [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]; then
    VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
    . "$HOME/.local/bin/virtualenvwrapper.sh"
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi
