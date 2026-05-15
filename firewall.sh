#!/bin/bash
# Run on VPS - open ports

ufw allow ssh
ufw allow 1080/tcp   # SOCKS5
ufw allow 3128/tcp   # HTTP proxy backup
ufw --force enable

echo "Firewall configured"
ufw status