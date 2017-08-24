#!/usr/bin/env bash

set -e

# Currently just for information
external_packages=(
    deadbeef
    dropbox
    racket
    sshuttle
    sublime-text3
    telegram
)

python3_packages=(
    awscli
    bpython
    flake8
    httpie
    saws
    virtualenv
    virtualenvwrapper
    youtube-dl
)

fedora_packages=(
    ShellCheck
    VirtualBox
    ansible
    aspell
    aspell-en
    autojump
    chicken
    chromium
    cloc
    colordiff
    dconf-editor
    diffstat
    dnsmasq
    dnsmasq-utils
    doxygen
    emacs
    erlang
    fabric
    fasd
    gettext
    git
    git-extras
    gnome-shell-extension-topicons-plus
    gnome-tweak-tool
    gnutls
    golang
    haskell-platform
    htop
    jq
    libpng-devel
    libtiff-devel
    libyaml-devel
    lnav
    lua
    manedit
    meld
    mercurial
    mpv
    mtr
    nano
    ncdu
    patch
    patchutils
    powerline
    powerline-fonts
    psutils
    pv
    python3-devel
    rust
    scanmem
    sloccount
    sqlite
    systemtap
    the_silver_searcher
    tig
    tmux
    tmux-powerline
    transmission
    tree
    vagrant
    wget
)

print_info() {
    printf "\e[0;33m[INFO] %s\e[0m\n" "$1"
}

print_success() {
    printf "\e[0;32m[OK] %s\e[0m\n" "$1"
}

print_error() {
    printf "\e[0;31m[ERROR] %s\e[0m\n" "$1"
}

install_system_deps() {
    print_info "Installing system dependencies and updates..."
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf upgrade -y
    print_success "All system dependencies and updates are installed."
}

install_fedora_packages() {
    print_info "Installing Fedora packages..."
    sudo dnf group install -y --with-optional "C Development Tools and Libraries"
    sudo dnf install -y "${fedora_packages[@]}"
    print_success "All Fedora packages are installed."
}

install_python3_packages() {
    print_info "Installing Python 3 packages..."
    pip3 install --user --upgrade "${python3_packages[@]}"
    print_success "All Python 3 packages are installed."
}

apply_dconf_settings() {
    print_info "Applying dconf settings..."
    dconf load / < dconf.settings
    print_success "Settings are successfully applied."
}

update_configs() {
    print_info "Updating configuration files..."

    # Update bash configuration
    cp bashrc ~/.bashrc
    cp bash_profile ~/.bash_profile
    rsync -Ir --exclude=.* bash/ ~/.bash

    # Update git configuration
    cp gitconfig ~/.gitconfig
    cp gitignore_global ~/.gitignore_global

    # Update flake8 configuration
    cp flake8 ~/.flake8

    # Update emacs configuration
    rsync -Ir --exclude=.* emacs.d/ ~/.emacs.d

    # Update leiningen configuration
    rsync -Ir --exclude=.* lein/ ~/.lein

    # Update pip configuration
    rsync -Ir --exclude=.* pip/ ~/.config/pip

    # Update powerline configuration
    rsync -Ir --exclude=.* powerline/ ~/.config/powerline

    # Update racket configuration
    cp racketrc ~/.racketrc

    # Update tmux configuration
    cp tmux.conf ~/.tmux.conf

    print_success "Configuration files are successfully updated."
}

if [[ -f "/etc/redhat-release" ]] && grep -q "Fedora" "/etc/redhat-release"; then
    install_system_deps
    install_fedora_packages
    install_python3_packages
    apply_dconf_settings
    update_configs
else
    print_error "Currently only Fedora is supported. :("
fi
