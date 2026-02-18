#!/usr/bin/sh

# select files
mapfile -t FILESTOUPLOAD < <(fzf -m --bind 'tab:toggle+down,shift-tab:toggle+up' --preview 'echo "Files to upload:"; echo; nl -w2 -s". " {+f}')


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
  DEST=$(rclone lsf -R --dirs-only $SERVICE:$PREFIX | fzf --bind 'tab:replace-query,alt-enter:print-query+accept' --print-query --layout=reverse --border-label="Pick Destination" | { read query; read selection; echo "${selection:-$query}"; })

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

for file in "${FILESTOUPLOAD[@]}"; do
    rclone copy "$file" "$REMOTE_DEST" --checksum --update --progress
done
