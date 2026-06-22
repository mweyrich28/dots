#!/usr/bin/bash
DEST="/home/malte/OneDriver/ablage"
rclone move "onedrive:new" "$DEST" & 
