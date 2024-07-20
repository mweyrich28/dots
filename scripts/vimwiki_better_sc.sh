#!/usr/bin/env bash

name="$1"

# check if name already exists
if [ -f "/home/malte/documents/zettelkasten/assets/SCREENSHOTS/${name}.png" ]; then
    echo "File already exists. Exiting."
    exit 1
fi
out="/home/malte/documents/zettelkasten/assets/SCREENSHOTS/${name}.png"
sleep 3
gnome-screenshot -af "$out"
