#!/bin/sh

PKGS=(
catppuccin-gtk-theme-mocha kvantum-theme-catppuccin-git papirus-icon-theme 
lxappearance kvantum kvantum-qt5 
)

echo "Installing theme packages: ${PKGS[*]}"
paru -S --needed --noconfirm  "${PKGS[@]}"
