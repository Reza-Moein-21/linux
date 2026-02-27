#!/bin/sh

PKGS=(
catppuccin-gtk-theme-mocha kvantum-theme-catppuccin-git
yaru-icon-theme-git papirus-icon-theme 
kvantum kvantum-qt5 
)

echo "Installing theme packages: ${PKGS[*]}"
paru -S --needed --noconfirm  "${PKGS[@]}"
