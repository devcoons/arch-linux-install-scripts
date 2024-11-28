#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <hostname>"
    exit 1
fi

NEW_HOSTNAME="$1"

echo "Setting hostname to $NEW_HOSTNAME..."
echo "$NEW_HOSTNAME" > /etc/hostname

echo "Configuring /etc/hosts..."
cat > /etc/hosts <<EOL
127.0.0.1    localhost
::1          localhost
127.0.1.1    $NEW_HOSTNAME.localdomain $NEW_HOSTNAME
EOL

echo "Hostname and hosts configuration complete!"
