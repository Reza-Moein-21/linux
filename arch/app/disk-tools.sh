#!/bin/sh

PKGS=(
ntfs-3g
)

echo "Installing disk tools packages: ${PKGS[*]}"
paru -S --needed --noconfirm  "${PKGS[@]}"
