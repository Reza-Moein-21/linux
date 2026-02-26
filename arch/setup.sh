#!/bin/sh

set -e  # Exit on error

source ./app/sys-tools.sh
source ./app/waybar.sh
source ./app/fonts.sh
source ./app/web.sh
source ./app/media.sh
source ./app/dev-tools.sh
source ./app/disk-tools.sh
source ./app/theme.sh

#############################
#### FULL SYSTEM UPDATE #####
#############################
# paru -Suy --noconfirm


#############################
######## DOTFILES ###########
#############################
echo "###### Appling dotfiles #######"

stow -t $HOME -d ./dotfiles -D hypr
stow -t $HOME -d ./dotfiles hypr
echo "hypr dotfiles applied"

stow -t $HOME -d ./dotfiles -D font 
stow -t $HOME -d ./dotfiles font 
echo "font dotfiles applied"

stow -t $HOME -d ./dotfiles -D waybar 
stow -t $HOME -d ./dotfiles waybar 
echo "waybar dotfiles applied"

stow -t $HOME -d ./dotfiles -D brave 
stow -t $HOME -d ./dotfiles brave 
echo "brave dotfiles applied"

stow -t $HOME -d ./dotfiles -D fish 
stow -t $HOME -d ./dotfiles fish 
echo "fish dotfiles applied"

stow -t $HOME -d ./dotfiles -D starship 
stow -t $HOME -d ./dotfiles starship 
echo "starship dotfiles applied"

stow -t $HOME -d ./dotfiles -D gtk-3.0 
stow -t $HOME -d ./dotfiles gtk-3.0 
echo "gtk-3.0 dotfiles applied"

stow -t $HOME -d ./dotfiles -D gtk-4.0 
stow -t $HOME -d ./dotfiles gtk-4.0 
echo "gtk-4.0 dotfiles applied"
