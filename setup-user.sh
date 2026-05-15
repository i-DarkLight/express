#!/bin/bash
# Run on VPS - creates proxy user

PROXY_USER="admin"
PROXY_PASS="FlashLight@23"

# Create system user for proxy auth
useradd -r -s /bin/false $PROXY_USER
echo "$PROXY_USER:$PROXY_PASS" | chpasswd

echo "User created: $PROXY_USER"
echo "Password: $PROXY_PASS"