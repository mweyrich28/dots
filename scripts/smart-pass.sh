#!/bin/bash
selected=$(find ~/.password-store/ -regex ".*\.gpg$" | sed 's/\/home\/malte\/.password-store\///' | sed 's/.gpg//' | fzf --print-query | tail -n1)

if [ -n "$selected" ]; then
    pass edit "$selected"
fi
