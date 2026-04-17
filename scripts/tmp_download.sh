#!/usr/bin/bash
TMP_DEPOSIT="/tmp/tmp_downloads/"
PREF="onedrive:"
if [[ ! -d "$TMP_DEPOSIT" ]]; then
    mkdir "$TMP_DEPOSIT"
fi

mapfile -t FILESTODOWNLOAD < <(cat ~/.custom_cache/onedrive_cache.txt \
| fzf -m --bind 'tab:toggle+down,shift-tab:toggle+up' --preview 'echo "Files to download:"; echo; nl -w2 -s". " {+f}')

for file in "${FILESTODOWNLOAD[@]}"; do
    rclone copy "$PREF$file" "$TMP_DEPOSIT" & 
done

if [[ ${FILESTODOWNLOAD[@]} ]]; then
    xdg-open "$TMP_DEPOSIT"> /dev/null 2>&1 &
fi
