#!/bin/bash

CONFIG_FILE="$HOME/.zshrc"

add_alias() {
  local name=$1
  local command=$2

  # Check if the alias already exists
  if grep -q "alias $name=" "$CONFIG_FILE"; then
    echo "Alias '$name' already exists in $CONFIG_FILE. Skipping."
  else
    # Add the alias
    echo "alias $name='$command'" >>"$CONFIG_FILE"
    echo "Alias '$name' added to $CONFIG_FILE."
  fi
}

add_alias ssh_pi_hole "ssh chekko@192.168.0.13"
add_alias ssh_ubuntu "ssh chekko@192.168.0.4"
