#!/usr/bin/env bash

set -e

external_packages=(
    deadbeef
    dropbox
    jdk
    racket
    skype
    slack
    sublime-text3
    telegram
)


python3_packages=(
    awscli
    bpython
    flake8
    httpie
    virtualenv
    virtualenv-wrapper
    youtube-dl
)

dnf_packages=(
    ShellCheck
    ansible
    aspell
    aspell-en
    autojump
    chicken
    chromium
    cloc
    colordiff
    dnsmasq
    dnsmasq-utils
    emacs
    erlang
    fabric
    fasd
    gettext
    git
    git-extras
    gnutls
    golang
    haskell-platform
    htop
    libpng-devel
    libtiff-devel
    libyaml-devel
    lnav
    lua
    mpv
    mtr
    powerline
    powerline-fonts
    psutils
    pv
    python3-devel
    rust
    sloccount
    sqlite
    the_silver_searcher
    tig
    tmux
    transmission
    tree
    vagrant
    virtualbox
    wget
)


brew_packages=(
    ansible
    aspell
    autoconf
    autojump
    automake
    avro-tools
    awscli
    bash
    bash-completion
    binutils
    boost
    bsdmake
    chicken
    cloc
    cmake
    colordiff
    diff-so-fancy
    dnsmasq
    dos2unix
    erlang
    fasd
    findutils
    gdbm
    gettext
    git
    git-extras
    gmp
    gnu-sed
    gnupg
    gnutls
    go
    grc
    haskell-stack
    heroku-toolbelt
    htop-osx
    httpie
    hub
    jpeg
    leiningen
    libevent
    libgit2
    libpng
    libssh2
    libtasn1
    libtiff
    libtool
    libyaml
    lnav
    lua
    md5sha1sum
    mercurial
    moreutils
    mtr
    multimarkdown
    nanomsg
    nettle
    nginx
    openssl
    ossp-uuid
    pandoc
    pcre
    pkg-config
    postgresql
    proctools
    protobuf
    psgrep
    pstree
    psutils
    pv
    pypy
    python
    python3
    readline
    reattach-to-user-namespace
    redis
    rename
    rust
    shellcheck
    sloccount
    sqlite
    ssh-copy-id
    the_platinum_searcher
    the_silver_searcher
    thrift
    tig
    tmux
    tree
    unixodbc
    watch
    wget
    wrk
    wxmac
    xz
    youtube-dl
    emacs --with-gnutls --with-cocoa --with-ctags
)

cask_packages=(
    alfred
    appcleaner
    charles
    consul
    dropbox
    firefox
    font-inconsolata-for-powerline
    ghc
    google-chrome
    handbrake
    iterm2
    java
    karabiner
    keyboard-cleaner
    limechat
    lunchy
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    racket
    seil
    skype
    slack
    sublime-text3
    telegram
    the-unarchiver
    transmission
    ukelele
    vagrant
    vagrant-manager
    virtualbox
    vlc
    vox
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

install_osx_deps() {
    print_info "Checking and installing OS X deps..."

    sudo softwareupdate -iva

    if [[ ! -x /usr/bin/gcc ]]; then
        print_info "Installing OS X Command Line Tools..."
        xcode-select --install
    fi

    if [[ ! -x /usr/local/bin/brew ]]; then
        print_info "Installing Brew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    export PATH=/usr/local/bin:$PATH

    if [[ ! -x /usr/local/bin/ansible ]]; then
        print_info "Installing Ansible..."
        brew install ansible
    fi

    print_success "All dependencies are installed."
}

install_osx_packages() {
    print_info "Installing and upgrading packages..."

    brew tap caskroom/cask
    brew tap caskroom/fonts
    brew tap caskroom/versions
    brew update
    brew upgrade
    brew install "${brew_packages[@]}"
    brew linkapps
    brew cleanup
    brew cask install "${cask_packages[@]}"
    brew cask cleanup

    print_success "All packages are installed."
}

if [ "$(uname -s)" == "Darwin" ]; then
    install_osx_deps
    install_osx_packages
else
    print_error "Currently only OS X is supported. :("
fi
