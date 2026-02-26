#!/bin/sh


# Check if paru is already installed
if command -v paru &> /dev/null; then
    echo "paru is already installed. Skipping installation."
else
    echo "paru not found. Starting installation..."

    # Clone paru repository
    git clone https://aur.archlinux.org/paru.git /tmp/paru

    # Navigate to paru directory and install
    cd /tmp/paru || exit 1
    makepkg -si --noconfirm

    # Return to original directory
    cd - || exit 1

    echo "paru installation completed"
fi

# Optional: Clean up
if [ -d "/tmp/paru" ]; then
    echo "Cleaning up installation directory..."
    rm -rf /tmp/paru
fi



PKGS=(
zip unzip stow thunar thunar-shares-plugin thunar-volman starship
)

echo "Installing sys-tools packages: ${PKGS[*]}"
paru -S --needed --noconfirm  "${PKGS[@]}"
