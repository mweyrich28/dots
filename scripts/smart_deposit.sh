#!/usr/bin/sh

# parse service and prefix
while [ $# -gt 0 ]; do
  case "$1" in
    --service)
      SERVICE="$2"
      shift 2
      ;;
    --prefix)
      PREFIX="$2"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "Unknown option: $1"
      exit 1
      ;;
    *)
      break
      ;;
  esac
done

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
  echo "$@" | sed "s/ /\n- /g" | sed "s/^\S/- /"
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



for file in "$@"; do
    rclone copy "$file" "$REMOTE_DEST" --checksum --update --progress
done

