#!/bin/bash
# Run on VPS

systemctl enable danted
systemctl restart danted
systemctl status danted

echo "Testing proxy is alive..."
ss -tlnp | grep 1080