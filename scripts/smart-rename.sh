#!/usr/bin/env bash

FILETORENAME="$1"

old_base=$(basename "$FILETORENAME")
old_ext="${old_base##*.}"

if [[ "$old_ext" == "pdf" ]]; then
    open "$FILETORENAME" &
fi


selected=$(
    fzf --no-sort \
        < ~/.custom_cache/onedrive_cache.txt
) || exit 1

tmp=$(mktemp)

# Start with selected basename
basename "$selected" > "$tmp"

nvim "$tmp"

new_name=$(<"$tmp")
rm -f "$tmp"

# Trim whitespace
new_name=$(printf '%s' "$new_name" | xargs)

[ -z "$new_name" ] && exit 1

# Preserve extension if user didn't specify one
if [[ "$new_name" != *.* ]]; then
    new_name="${new_name}.${old_ext}"
fi

mv -- "$FILETORENAME" "$new_name"
