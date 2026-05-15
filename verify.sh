#!/bin/bash
# Run from anywhere to test proxy

VPS_IP="YOUR_VPS_IP"
PROXY_USER="admin"
PROXY_PASS="FlashLight@23"

curl -v \
  --socks5 $VPS_IP:1080 \
  --proxy-user $PROXY_USER:$PROXY_PASS \
  https://ipinfo.io

# Should return your VPS IP location