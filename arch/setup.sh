#!/bin/sh

set -e  # Exit on error

source ./app/paru.sh
source ./app/stow.sh

# Full system update
# paru -Suy --noconfirm
#

echo "Appling dotfiles"
stow -vv -t $HOME -d ./dotfiles -D hypr
stow -vv -t $HOME -d ./dotfiles hypr
