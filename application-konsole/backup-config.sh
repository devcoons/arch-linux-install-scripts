#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BACKUP_DIR="$SCRIPT_DIR/configuration"
mkdir -p "$BACKUP_DIR"

cp -r ~/.local/share/konsole "$BACKUP_DIR/konsole_profiles"
cp ~/.config/konsolerc "$BACKUP_DIR/konsolerc"
echo "Konsole profiles and configuration backed up"