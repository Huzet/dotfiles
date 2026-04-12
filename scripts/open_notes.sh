#!/bin/bash

TARGET_DIR=$MY_NOTES_DIR
echo "running script on $TARGET_DIR"

if [ -d "$TARGET_DIR" ]; then
    cd "$TARGET_DIR" || exit
    nvim .
else
    echo "Directory $TARGET_DIR not found."
    sleep 5
fi
