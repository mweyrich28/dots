#!/bin/bash
WALLPAPER_DIR="/home/malte/pictures/Wallpapers/Selected/"

# Get random wallpaper for screen 0 (eDP - laptop)
WALL=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)
nitrogen --set-zoom-fill --head=0 "$WALL"
# Set wallpaper for screen 1 (DisplayPort - external monitor)
nitrogen --set-zoom-fill --head=1 "$WALL"

