#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -r "$SCRIPT_DIR/configuration/konsole_profiles"/* ~/.local/share/konsole/
cp "$SCRIPT_DIR/configuration/konsolerc" ~/.config/
echo "Konsole profiles and configuration restored"