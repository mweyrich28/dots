#!/usr/bin/env bash
set -e

echo "Backing up password-store"
rclone copy ~/.password-store/ onedrive:06_Archiev/01_Passwords --exclude '.git/**' --exclude '.extensions/**' --progress 

echo "Syncing zettelkasten"
rclone sync ~/documents/zettelkasten/ onedrive:01_Dokumente/02_Notes/zettelkasten/ --progress --exclude '.git/**' --transfers 8 --checkers 16

echo "Syncing personal wiki"
rclone sync ~/documents/personal_wiki/ onedrive:01_Dokumente/02_Notes/personal_wiki/ --progress --exclude '.git/**' --transfers 8 --checkers 16

echo "Backup complete!"
