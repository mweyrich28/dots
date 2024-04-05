#!/usr/bin/env bash

vimwiki_header="――――  \ndate: $(date +%F)  \ntags:  \naliases:  \n――――  "

touch "$1.md"
echo -e "$vimwiki_header" >> "$1.md" # append just in case
