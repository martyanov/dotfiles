#!/usr/bin/env bash

set -e

python_packages=(
    flake8
    httpie
    pipx
    sshuttle
    virtualenv
    virtualenvwrapper
)

fedora_packages=(
    NetworkManager-tui
    ShellCheck
    age
    android-tools
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
    bemenu
    blktrace
    bpfmon
    bpftool
    bpftrace
    cargo
    cloc
    colordiff
    dconf-editor
    devscripts
    diffstat
    dnf-plugin-system-upgrade
    dnsmasq
    dnsmasq-utils
    doxygen
    dsniff
    dstat
    easyeffects
    emacs
    entr
    eza
    fd-find
    fio
    fira-code-fonts
    firefox
    fzf
    gammastep
    gettext
    git
    git-delta
    git-extras
    gnome-shell-extension-topicons-plus
    gnome-tweak-tool
    gnutls
    golang
    grim
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
    mako
    manedit
    mediawriter
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
    peek
    pinentry
    psutils
    pv
    python3-devel
    qrencode
    ripgrep
    rust
    scanmem
    seahorse
    skim
    sloccount
    slurp
    sqlite
    starship
    sway
    swayidle
    swaylock
    sysbench
    sysstat
    systemtap
    tealdeer
    telegram-desktop
    the_silver_searcher
    tig
    tokei
    transmission
    tree
    unrar
    vmtouch
    wget
    wireguard-tools
    wireshark
    wl-clipboard
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

install_python_packages() {
    print_info "Installing Python packages..."
    python -m pip install --user --upgrade pip wheel
    python -m pip install --user --upgrade "${python_packages[@]}"
    print_success "All Python packages are installed."
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

    # Update starship configuration
    cp starship.toml ~/.config/starship.toml

    print_success "Configuration files are successfully updated."
}

if [[ -f "/etc/redhat-release" ]] && grep -q "Fedora" "/etc/redhat-release"; then
    install_system_deps
    install_fedora_packages
    install_python_packages
    apply_dconf_settings
    update_configs
else
    print_error "Currently only Fedora is supported. :("
fi
