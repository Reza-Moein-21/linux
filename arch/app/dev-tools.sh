#!/bin/sh

PKGS=(
nvim git github-cli lazygit docker docker-compose nvm
)

echo "Installing dev tools packages: ${PKGS[*]}"
paru -S --needed --noconfirm  "${PKGS[@]}"

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

