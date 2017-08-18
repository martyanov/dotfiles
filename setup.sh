#!/usr/bin/env bash

set -e

# Currently just for information
external_packages=(
    deadbeef
    dropbox
    jdk
    racket
    sublime-text3
    telegram
)

python3_packages=(
    awscli
    bpython
    flake8
    httpie
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

if [[ -f "/etc/redhat-release" ]] && grep -q "Fedora" "/etc/redhat-release"; then
    install_system_deps
    install_fedora_packages
    install_python3_packages
    apply_dconf_settings
else
    print_error "Currently only Fedora is supported. :("
fi
