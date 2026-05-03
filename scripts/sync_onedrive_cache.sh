#!/usr/bin/bash
rclone lsf -R onedrive: --files-only \
--exclude "01_Dokumente/02_Notes/**" \
--exclude "02_QuickAccess/**" \
--exclude "03_GoodNotes/**" \
--exclude "04_Bilder/**" \
--exclude "05_Freigaben/**" \
--exclude "06_Archiev/**" \
--exclude "Persönlicher Tresor/**" | sort > ~/.custom_cache/buff.txt

# update cache only if sucess
if [ ${PIPESTATUS[0]} -eq 0 ]; then
    mv ~/.custom_cache/buff.txt ~/.custom_cache/onedrive_cache.txt
else
    rm -f ~/.custom_cache/buff.txt
fi
