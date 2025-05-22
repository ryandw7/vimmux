#!/bin/bash
echo "Script started"

LAST_FILE=""

while true; do
  FILE=$(head -n 1 /tmp/vimmux_current_file.txt 2>/dev/null)
  FILE="${FILE//$'\n'/}"

  # Skip if nothing changed
  if [[ -z "$FILE" || "$FILE" == "$LAST_FILE" ]]; then
    sleep 0.5
    continue
  fi

  LAST_FILE="$FILE"

  DIR=$(dirname "$FILE")

  if [ ! -e "$FILE" ] && [ ! -d "$DIR" ]; then
    clear
    echo "FILE or DIR does not exist"
    echo "FILE = '$FILE'"
    echo "DIR = '$DIR'"
    sleep 1
    continue
  fi

  PROJECT_ROOT=$(echo "$DIR" | grep -o '.*/vimmux')

  clear
  if [[ -z "$PROJECT_ROOT" ]]; then
    echo "Could not detect vimmux root"
    echo "FILE = $FILE"
    echo "DIR = $DIR"
  else
    echo "$(echo "$FILE" | grep -o 'vimmux/.*')"
    echo
    echo "$PROJECT_ROOT"
    tree -L 1 "$PROJECT_ROOT" 2>/dev/null || echo "tree failed"
  fi

  echo "------------------------"
  sleep 0.5
done


