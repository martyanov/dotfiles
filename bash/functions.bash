#!/bin/bash

# List all available terminal colors
lc() {
    for i in {0..255} ; do
        printf "\x1b[38;5;%smcolour%s\n" "${i}"
    done
}

# List tree with enabled color output and paging via less
lst() {
    tree -a -C -I '.git' --dirsfirst "$@" | less -NR
}

# Generate random password
genpw() {
    gpg -a --gen-rand 1 9
}
