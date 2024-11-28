#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 /mnt"
    exit 1
fi

TARGET_MOUNT="$1"

PACKAGES=(
    base
    base-devel
    linux
    linux-firmware
    linux-headers
    intel-ucode
    hwdetect
    nano
    mtools
    dosfstools
    networkmanager
    sddm
    mesa
    nvidia
    intel-gpu-tools
    intel-media-driver
    wayland
    plasma
    alsa-utils
    bluez
    bluez-utils
    rsync
    openssh
    cmake
    go
    git
    wget
    firefox
    konsole
    kcalc
    dolphin
    ark
    spectacle
    tree
)

echo "Installing base system to $TARGET_MOUNT..."
pacstrap "$TARGET_MOUNT" "${PACKAGES[@]}" || { echo "pacstrap failed! Exiting."; exit 1; }

echo "Generating fstab..."
genfstab -U "$TARGET_MOUNT" >> "$TARGET_MOUNT/etc/fstab" || { echo "Failed to generate fstab! Exiting."; exit 1; }

echo "Base system installation and fstab generation complete!"
