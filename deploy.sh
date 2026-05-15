#!/bin/bash
# Run this FROM Codespaces
# It only copies files to VPS, no remote execution

VPS=$1

if [ -z "$VPS" ]; then
    echo "Usage: bash scripts/deploy.sh root@YOUR_VPS_IP"
    exit 1
fi

echo "==> Copying files to VPS..."
scp config/danted.conf $VPS:/tmp/danted.conf
scp scripts/install.sh $VPS:/tmp/install.sh
scp scripts/setup-user.sh $VPS:/tmp/setup-user.sh
scp scripts/firewall.sh $VPS:/tmp/firewall.sh
scp scripts/start-proxy.sh $VPS:/tmp/start-proxy.sh

echo "==> Files copied!"
echo ""
echo "==> Now SSH into your VPS and run:"
echo "    bash /tmp/install.sh"
echo "    bash /tmp/setup-user.sh"
echo "    cp /tmp/danted.conf /etc/danted.conf"
echo "    bash /tmp/firewall.sh"
echo "    bash /tmp/start-proxy.sh"
