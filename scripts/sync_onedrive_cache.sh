#!/usr/bin/bash
rclone lsf -R onedrive: --files-only \
--exclude "01_Dokumente/02_Notes/**" \
--exclude "01_Dokumente/04_Passwords/**" \
--exclude "01_Dokumente/03_Bildung/02_Schule/**" \
--exclude "03_GoodNotes/**" \
--exclude "02_QuickAccess/**" \
--exclude "04_Bilder/**" \
--exclude "Persönlicher Tresor/**" \
--exclude ".xdg-volume-info" \
--exclude ".Trash**" | sort > ~/.custom_cache/buff.txt

# update cache only if sucess
if [ ${PIPESTATUS[0]} -eq 0 ]; then
    mv ~/.custom_cache/buff.txt ~/.custom_cache/onedrive_cache.txt
else
    rm -f ~/.custom_cache/buff.txt
fi
