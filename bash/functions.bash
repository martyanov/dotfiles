#!/bin/bash

# List all available terminal colors
lc() {
    for i in {0..255} ; do
        printf "\x1b[38;5;%sm%s\n" "${i}" "${i}"
    done
}

# List tree with enabled color output and paging via less
lst() {
    tree -a -C -I '.git' --dirsfirst "$@" | less -NR
}

# Generate random password and put it to clipboard
genpw() {
    gpg -a --gen-rand 2 24 | xclip -f -r | xclip -r -selection clipboard
}
