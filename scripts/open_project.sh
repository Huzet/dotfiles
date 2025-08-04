#!/bin/bash

CODE_DIR="$HOME/code"
TMPFILE=$(mktemp)

# Run popup with fzf inside, redirect selection to TMPFILE
tmux display-popup -w 90% -h 80% -E "find \"$CODE_DIR\" -maxdepth 1 -mindepth 1 -type d | xargs -I{} basename {} | fzf --prompt='Select project: ' > $TMPFILE"

# Read the selected project from TMPFILE
project=$(cat "$TMPFILE")
rm "$TMPFILE"

# If no selection, exit
[ -z "$project" ] && exit

# Open new tmux window with nvim in project directory
tmux new-window -c "$CODE_DIR/$project" -n "$project" "nvim"

