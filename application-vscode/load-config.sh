#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cp "$SCRIPT_DIR/configuration/settings.json" ~/.config/Code/User/settings.json
cp "$SCRIPT_DIR/configuration/keybindings.json" ~/.config/Code/User/keybindings.json

if [ -f "$SCRIPT_DIR/configuration/extensions.txt" ]; then
    echo "Installing extensions..."
    while read -r extension; do
        code --install-extension "$extension"
    done < "$SCRIPT_DIR/configuration/extensions.txt"
fi

echo "Visual Studio Code configuration restored"