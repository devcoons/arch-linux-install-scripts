#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "$SCRIPT_DIR/configuration/bashrc" ~/.bashrc
source ~/.bashrc
echo ".bashrc configuration restored"