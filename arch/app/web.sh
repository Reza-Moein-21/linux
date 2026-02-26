#!/bin/sh

PKGS=(
brave persepolis	
)

echo "Installing web packages: ${PKGS[*]}"
paru -S --needed --noconfirm  "${PKGS[@]}"
