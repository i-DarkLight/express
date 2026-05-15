#!/bin/bash
# Run this from Codespaces
# Usage: bash scripts/deploy.sh root@YOUR_VPS_IP

set -e

VPS=$1

if [ -z "$VPS" ]; then
    echo "Usage: bash scripts/deploy.sh root@YOUR_VPS_IP"
    exit 1
fi

echo "==> Deploying to $VPS..."

# Copy config files to VPS
scp config/danted.conf $VPS:/tmp/danted.conf
scp scripts/install.sh $VPS:/tmp/install.sh
scp scripts/setup-user.sh $VPS:/tmp/setup-user.sh
scp scripts/firewall.sh $VPS:/tmp/firewall.sh
scp scripts/start-proxy.sh $VPS:/tmp/start-proxy.sh

# Run them in order on VPS
ssh $VPS "bash /tmp/install.sh"
ssh $VPS "bash /tmp/setup-user.sh"
ssh $VPS "cp /tmp/danted.conf /etc/danted.conf"
ssh $VPS "bash /tmp/firewall.sh"
ssh $VPS "systemctl enable danted && systemctl restart danted"

echo ""
echo "==> Deployment done!"
echo "==> Test with: bash scripts/verify.sh"