#!/usr/bin/env bash
name=$2
name_formatted=${name//_/ }
vimwiki_header="---\ntitle: $name\nauthor: Malte A. Weyrich\ndate: $(date +%F)\n---\n# $name_formatted"

touch "$1.md"
echo -e "$vimwiki_header" >> "$1.md" # append just in case
