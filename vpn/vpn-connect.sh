#!/bin/bash

VPN_USER=pre1m2019605
VPN_PASS=32925

# Define your VPN servers with friendly names
declare -A VPN_SERVERS=(
    ["us"]="cmhous.goodfst.com"
    ["nl"]="cmhonl.goodfst.com"
    ["ca"]="cmhoca.goodfst.com"
    ["tr"]="cmhotr.goodfst.com"
)

echo "Available VPN servers:"
for name in "${!VPN_SERVERS[@]}"; do
    echo "  $name -> ${VPN_SERVERS[$name]}"
done

echo ""
read -p "Enter VPN server name: " SERVER_NAME

if [[ -z "${VPN_SERVERS[$SERVER_NAME]}" ]]; then
    echo "Error: Unknown server name '$SERVER_NAME'"
    exit 1
fi

VPN_HOST="${VPN_SERVERS[$SERVER_NAME]}"

echo "Connecting to $SERVER_NAME ($VPN_HOST)..."
echo -e $VPN_PASS | sudo openconnect --user=$VPN_USER $VPN_HOST --passwd-on-stdin 
