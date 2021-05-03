#!/usr/bin/env bash

set -e

python3_packages=(
    bpython
    flake8
    httpie
    sshuttle
    virtualenv
    virtualenvwrapper
    youtube-dl
)

fedora_packages=(
    ansible
    aspell
    aspell-en
    atop
    autojump
    awscli
    bat
    bcc
    bcc-devel
    bcc-tools
    bpfmon
    bpftool
    bpftrace
    cargo
    chicken
    cloc
    colordiff
    dconf-editor
    deadbeef
    devscripts
    diffstat
    dnsmasq
    dnsmasq-utils
    doxygen
    dsniff
    dstat
    emacs
    entr
    erlang
    exa
    fd-find
    fio
    firefox
    fzf
    gettext
    git
    git-delta
    git-extras
    gnome-shell-extension-topicons-plus
    gnome-tweak-tool
    gnutls
    golang
    htop
    httperf
    idris
    ioping
    iotop
    iproute
    iptraf-ng
    jq
    libcgroup-tools
    libpng-devel
    libtiff-devel
    libyaml-devel
    lnav
    lshw
    lua
    manedit
    meld
    mercurial
    mosh
    most
    mpv
    mtr
    nano
    ncdu
    nethogs
    ngrep
    nmap
    nss-tools
    patch
    patchelf
    patchutils
    powerline
    powerline-fonts
    psutils
    pv
    python3-devel
    qrencode
    ripgrep
    rubygem-rexml
    rust
    scanmem
    seahorse
    shellcheck
    skim
    sloccount
    sqlite
    starship
    sysbench
    sysstat
    systemtap
    tealdeer
    telegram-desktop
    the_silver_searcher
    tig
    tilix
    tiptop
    tokei
    transmission
    tree
    unrar
    vagrant
    vmtouch
    wget
    wireguard-tools
    xclip
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
    python3 -m pip install --user --upgrade "${python3_packages[@]}"
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

    # Update emacs configuration
    rsync -Ir --exclude=.* emacs.d/ ~/.emacs.d

    # Update pip configuration
    rsync -Ir --exclude=.* pip/ ~/.config/pip

    # Update powerline configuration
    rsync -Ir --exclude=.* powerline/ ~/.config/powerline

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
