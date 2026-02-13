#!/bin/bash

# After things to do, with minimal arch installation

set -e  # Exit on error

# Update package database first
echo "Updating package database..."
sudo pacman -Suy --noconfirm
paru -Suy --noconfirm

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

# List of packages to install
PACKAGES=(
  base-devel linux-headers
  pipewire pipewire-alsa pipewire-pulse wireplumber
  networkmanager networkmanager-openconnect blueman bluez 
  polkit polkit-kde-agent 
  unzip p7zip unrar htop wget curl openssh persepolis
  zsh zsh-autosuggestions zsh-syntax-highlighting
  ttf-cascadia-mono-nerd ttf-roboto-mono-nerd inter-font

  nvim git github-cli lazygit
  docker docker-compose

  plasma
#  hyprland hyprutils hyprlock xdg-desktop-portal-hyprland
#  hyprlauncher hyprsunset hyprpicker hyprpaper hypridle
#  swaync grim slurp wl-clipboard brightnessctl playerctl pamixer
#  xdg-user-dirs xdg-utils celluloid papers

  tlp powertop


  nvidia-dkms nvidia-utils nvidia-settings lib32-nvidia-utils vulkan-icd-loader lib32-vulkan-icd-loader
  vulkan-intel lib32-vulkan-intel
  gamemode lib32-gamemode
  steam 
)

echo "Installing packages: ${PACKAGES[*]}"
sudo pacman -S --needed --noconfirm  "${PACKAGES[@]}"

AUR_PACKAGES=(
  vazirmatn-fonts bibata-cursor-theme
  egl-wayland
  dxvk-bin vkd3d lib32-vkd3d
#  asusctl supergfxctl rog-control-center
  protonup-qt lutris heroic-games-launcher
  # bottles
)
echo "Installing aur packages: ${AUR_PACKAGES[*]}"
paru -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "Installation completed successfully!"

sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now tlp

# sudo systemctl enable --now gamemoded
# sudo systemctl enable --now supergfxd
# supergfxctl -m hybrid      # recommended
# supergfxctl -m dedicated  # max performance
# supergfxctl -m integrated # battery saving

xdg-user-dirs-update

echo "Setting up Docker..."

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to docker group
sudo usermod -aG docker $USER

echo "Docker Setup finished successfully!"

git config --global user.name "reza_moein"
git config --global user.email "rezamoeinpe@gmail.com"
