#!/usr/bin/bash
# update cache only if sucess
rclone lsf -R onedrive:01_Dokumente --files-only | sort > ~/.custom_cache/buff.txt
if [ ${PIPESTATUS[0]} -eq 0 ]; then
    mv ~/.custom_cache/buff.txt ~/.custom_cache/onedrive_cache.txt
else
    rm -f ~/.custom_cache/buff.txt
fi
