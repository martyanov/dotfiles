#!/usr/bin/env bash

set -e

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

if [ "$(uname -s)" == "Darwin" ]; then
    install_osx_deps
else
    print_error "Currently only OS X is supported. :("
fi
