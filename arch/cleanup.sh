#!/bin/sh

PKGS=(
firefox dolphin kwallet kwalletmanager kwallet-pam kde-cli-tools vlc-plugin-kwallet vlc-plugins-all 
)
echo "Uninstalling packages: ${PKGS[*]}"
paru -Rns $(paru -Qq "${PKGS[@]}" 2>/dev/null)
