#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BACKUP_DIR="$SCRIPT_DIR/configuration"
mkdir -p "$BACKUP_DIR"
cp ~/.bashrc "$BACKUP_DIR/bashrc"
echo ".bashrc configuration backed up"