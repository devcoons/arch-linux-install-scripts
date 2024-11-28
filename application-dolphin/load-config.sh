#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp "$SCRIPT_DIR/configuration/dolphinrc" ~/.config/
cp "$SCRIPT_DIR/configuration/dolphinui.rc" ~/.config/

if [ -d "$SCRIPT_DIR/configuration/view_properties" ]; then
    mkdir -p ~/.local/share/dolphin/view_properties
    cp -r "$SCRIPT_DIR/configuration/view_properties"/* ~/.local/share/dolphin/view_properties/
fi

echo "Dolphin configuration restored"