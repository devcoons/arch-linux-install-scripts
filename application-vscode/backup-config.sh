#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BACKUP_DIR="$SCRIPT_DIR/configuration"
mkdir -p "$BACKUP_DIR"

cp ~/.config/Code/User/settings.json "$BACKUP_DIR/settings.json"
cp ~/.config/Code/User/keybindings.json "$BACKUP_DIR/keybindings.json"
code --list-extensions > "$BACKUP_DIR/extensions.txt"

echo "Visual Studio Code configuration backed up"