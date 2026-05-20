#!/usr/bin/bash
DEST="/home/malte/OneDriver/ablage"
rclone sync "onedrive:new" "$DEST" & 
