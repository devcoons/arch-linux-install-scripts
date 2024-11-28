#!/bin/bash

if [[ ! -f packages-official.list || ! -f packages-unofficial.list ]]; then
    echo "Missing package list files. Make sure 'packages-official.list' and 'packages-unofficial.list' are present."
    exit 1
fi

echo "Installing official packages..."
while read -r line; do
    package=$(echo "$line" | awk '{print $1}')
    version=$(echo "$line" | awk '{print $2}')
    sudo pacman -S --needed "$package=$version" --noconfirm
done < packages-official.list

echo "Installing unofficial packages..."
while read -r line; do
    package=$(echo "$line" | awk '{print $1}')
    version=$(echo "$line" | awk '{print $2}')
    
    git clone "https://aur.archlinux.org/$package.git" || {
        echo "Failed to clone repository for $package. Skipping..."
        continue
    }

    cd "$package" || continue
    makepkg -si --noconfirm
    cd ..
    rm -rf "$package"

    echo "$package@$version installed."
done < packages-unofficial.list

echo "Installation complete."
