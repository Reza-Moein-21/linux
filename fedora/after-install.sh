#!/bin/sh


if ! grep -q 'fastestmirror=true' /etc/dnf/dnf.conf
then
echo "fastestmirror=true" >> /etc/dnf/dnf.conf;    
fi

if ! grep -q 'max_parallel_downloads=10' /etc/dnf/dnf.conf
then
echo  "max_parallel_downloads=10" >> /etc/dnf/dnf.conf;
fi

if ! grep -q 'Defaults pwfeedback' /etc/sudoers
then
echo "Defaults pwfeedback" >> /etc/sudoers;
fi

# Update 
sudo dnf update -y;

# install rpmFution 
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;

sudo dnf update -y;

# Install common app
sudo dnf install -y\
	alacritty wofi grim slurp wl-clipboard brightnessctl swaylock\
	git vim tor obfs4 privoxy persepolis zsh\
       	vazirmatn-fonts	

# Installing sharhip
sudo dnf copr enable -y atim/starship
sudo dnf install -y  starship

# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


echo ### Configure git ####
git config --global user.name reza_moein
git config --global user.email rezamoeinpe@gmail.com

echo ### run tor and privoxy service ###
systemctl enable tor.service
systemctl start tor.service
systemctl enable privoxy.service
systemctl start privoxy.service

# Configure grub font size 
sudo cp -v /etc/vconsole.conf /etc/vconsole.original
sudo cp -v /etc/default/grub /etc/default/grub.original

sudo grub2-mkconfig -o /boot/grub2/grub.cfg 

# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# add alise









