# Source custom scripts
for script_path in "$HOME/.bash/"{aliases,exports,functions}".bash"; do
    if [ -f "$script_path" ]; then
        . "$script_path"
    fi
done

# Enable tab completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
fi

# Activate generic colorizer
if [ -f "$(brew --prefix)/etc/grc.bashrc" ]; then
    . "$(brew --prefix)/etc/grc.bashrc"
fi

# Powerline
if [ -f "$HOME/.powerline/powerline/bindings/bash/powerline.sh" ]; then
    powerline-daemon -q
    . "$HOME/.powerline/powerline/bindings/bash/powerline.sh"
fi

# Activate virtualenvwrapper
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then
    . "/usr/local/bin/virtualenvwrapper.sh"
else
    echo "WARNING: Can't find virtualenvwrapper.sh"
fi

# Opam
if [ -f "$HOME/.opam/opam-init/init.sh" ]; then
   . "$HOME/.opam/opam-init/init.sh"
fi
