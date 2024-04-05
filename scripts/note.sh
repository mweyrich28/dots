#!/usr/bin/env bash

vimwiki_index_path="/home/malte/documents/vimwiki_para/"

if [[ "$1" == "" ]]; then
    cd "$vimwiki_index_path" && nvim "index.md"
elif [[ "$2" == "" ]]; then
    vimwiki_header="――――  \ndate: $(date +%F)  \ntags:  \naliases:  \n――――  "
    cd "$vimwiki_index_path" 
    touch "$1.md"
    echo -e "$vimwiki_header" >> "$1.md"
    nvim "$1.md"
else
    tags=":"
    for tag in "${@:2}"; do
      tags="$tags$tag:"
    done
    vimwiki_header="――――  \ndate: $(date +%F)  \ntags: $tags  \naliases:  \n――――  "
    cd "$vimwiki_index_path" 
    touch "$1.md"
    echo -e  "$vimwiki_header" >> "$1.md"
    nvim "$1.md"
fi
