#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BACKUP_DIR="$SCRIPT_DIR/configuration"
mkdir -p "$BACKUP_DIR"

cp ~/.config/dolphinrc "$BACKUP_DIR/dolphinrc"
cp ~/.config/dolphinui.rc "$BACKUP_DIR/dolphinui.rc"

if [ -d ~/.local/share/dolphin/view_properties ]; then
    mkdir -p "$BACKUP_DIR/view_properties"
    cp -r ~/.local/share/dolphin/view_properties/* "$BACKUP_DIR/view_properties/"
fi

echo "Dolphin configuration backed up"