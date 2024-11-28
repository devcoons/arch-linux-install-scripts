#!/bin/bash

# Check if the partition parameter is provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 /dev/partition (e.g., /dev/nvme1n1p2)"
    exit 1
fi

ROOT_PART="$1"

echo "Installing systemd-boot..."
bootctl install || { echo "Failed to install systemd-boot"; exit 1; }

LOADER_CONF="/boot/loader/loader.conf"
echo "default arch.conf" >> "$LOADER_CONF"

ROOT_UUID=$(blkid -s UUID -o value "$ROOT_PART")
if [[ -z "$ROOT_UUID" ]]; then
    echo "Failed to retrieve UUID for $ROOT_PART"
    exit 1
fi

ARCH_CONF="/boot/loader/entries/arch.conf"
echo "Creating $ARCH_CONF..."
cat > "$ARCH_CONF" <<EOL
title    Arch Linux
linux    /vmlinuz-linux
initrd   /initramfs-linux.img
options  root=UUID=$ROOT_UUID rw
EOL

ARCH_FB_CONF="/boot/loader/entries/arch-fb.conf"
echo "Creating $ARCH_FB_CONF..."
cat > "$ARCH_FB_CONF" <<EOL
title    Arch Linux Fallback
linux    /vmlinuz-linux
initrd   /initramfs-linux-fallback.img
options  root=UUID=$ROOT_UUID rw
EOL

echo "Systemd-boot setup is complete!"
