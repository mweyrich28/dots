#!/usr/bin/bash

# select files
# mapfile -t FILESTOUPLOAD < <(fzf -m --bind 'tab:toggle+down,shift-tab:toggle+up' --preview 'echo "Files to upload:"; echo; nl -w2 -s". " {+f}')
mapfile -t FILESTOUPLOAD < <(
  find ~/documents ~/downloads ~/OneDriver ~/pictures ~/temp/ ~/desktop -type f \
  | fzf -m \
      --bind 'tab:toggle+down,shift-tab:toggle+up' \
      --preview 'echo "Files to download:"; echo; cat {+f} | sed -e "s/.*\///" | uniq '
)


SERVICE=$1
PREFIX=$2

if [ -z "$SERVICE" ]; then
  echo "--service is required"
  exit 1
fi

if [ -z "$PREFIX" ]; then
  echo "--service is required"
  exit 1
fi


# pick remote dest
while :; do

  mapfile -t DEST < <(cat ~/.custom_cache/onedrive_cache_folders.txt \
  | fzf --bind 'tab:replace-query,alt-enter:print-query+accept' --print-query --no-sort --layout=reverse --border-label="Pick Destination" | { read query; read selection; echo "${selection:-$query}"; })

  [ -z "$DEST" ] && {
    echo "No destination selected. Aborting."
    exit 1
  }

  REMOTE_DEST="$SERVICE:${PREFIX%/}/${DEST#/}"
  echo "Uploading files:"
  for file in "${FILESTOUPLOAD[@]}"; do
     echo "- $file"
  done
  echo
  echo "To destination:"
  echo "$REMOTE_DEST"
  echo

  printf "Proceed? [y/N]: "
  read ans

  case "$ans" in
    y|Y|yes|YES)
      break
      ;;
    *)
      echo "Re-selecting destination..."
      echo
      ;;
  esac
done

rclone mkdir "$REMOTE_DEST"
for file in "${FILESTOUPLOAD[@]}"; do
    rclone move "$file" "$REMOTE_DEST" --checksum --update &
done

bash "/home/malte/.config/scripts/sync_onedrive_cache.sh" &
