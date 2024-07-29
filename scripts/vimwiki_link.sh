#!/usr/bin/env bash
name=$2
name_formatted=${name//_/ }
vimwiki_header="# $name_formatted\n> **date:** $(date +%F)  \n> **tags:** \n> **material:**\n\n"

touch "$1.md"
echo -e "$vimwiki_header" >> "$1.md" # append just in case
