#!/bin/sh

PKGS=(
	celluloid
)

echo "Installing media packages: ${PKGS[*]}"
paru -S --needed --noconfirm  "${PKGS[@]}"
