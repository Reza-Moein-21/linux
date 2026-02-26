#!/bin/sh

FONTS=(
  ttf-cascadia-mono-nerd ttf-roboto-mono-nerd inter-font vazirmatn-fonts
)

echo "Installing fonts: ${FONTS[*]}"
paru -S --needed --noconfirm  "${FONTS[@]}"
