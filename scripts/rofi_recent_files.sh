#!/usr/bin/sh
grep -oP '(?<=file://)([^<]+)' ~/.local/share/recently-used.xbel | \
cut -f1 -d"\"" | sed "s/\%20/\\\ /g" |  \
while read f; do [ -f "$f" ] && echo "$f"; done | \
awk -F'/' '{print $NF"|"$0}' | \
rofi -dmenu -i -p 'Recent Files' -display-columns 1 | \
cut -d'|' -f2 | \
xargs -I{} xdg-open '{}'
