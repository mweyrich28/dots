#!/usr/bin/sh
grep -oP '(?<=file://)([^<]+)' ~/.local/share/recently-used.xbel | \
awk -F" " '{print $4,$1}' | sort -r | cut -f2 -d" " | sed 's/"//' | \
python3 -c "
import sys, urllib.parse
for line in sys.stdin:
    print(urllib.parse.unquote(urllib.parse.unquote(line.strip())))
" | \
while read f; do [ -f "$f" ] && echo "$f"; done | \
awk -F'/' '{print $NF"|"$0}' | \
rofi -dmenu -i -p 'Recent Files' -display-columns 1 | \
cut -d'|' -f2 | \
xargs -I{} xdg-open '{}'
