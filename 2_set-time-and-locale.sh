#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 Region City"
    echo "Example: $0 Europe London"
    exit 1
fi

REGION="$1"
CITY="$2"
TIMEZONE="/usr/share/zoneinfo/$REGION/$CITY"

if [ ! -f "$TIMEZONE" ]; then
    echo "Error: Timezone $TIMEZONE does not exist."
    exit 1
fi

echo "Setting time zone to $REGION/$CITY..."
ln -sf "$TIMEZONE" /etc/localtime

echo "Synchronizing hardware clock..."
hwclock --systohc

LOCALE_CONF="/etc/locale.conf"
LOCALE_GEN="/etc/locale.gen"

echo "Setting language to en_US.UTF-8..."
sed -i '/^#en_US\.UTF-8 UTF-8/s/^#//' "$LOCALE_GEN"

echo "Generating locale..."
locale-gen

echo "Creating $LOCALE_CONF..."
echo "LANG=en_US.UTF-8" > "$LOCALE_CONF"

echo "Time zone and language settings have been configured successfully."
