#!/bin/bash
# Run this on your VPS
# ssh user@your_vps_ip then paste this

apt update && apt upgrade -y
apt install -y dante-server ufw

echo "Dante SOCKS5 installed"