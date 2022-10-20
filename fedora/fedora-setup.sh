dnf update -y
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf update -y
dnf install -y audacity
dnf install -y gimp
dnf install -y persepolis
dnf install -y remmina
dnf install -y geary
dnf install -y vlc
dnf install -y gnome-tweaks
dnf install -y nodejs
dnf install -y openfortivpn
dnf install -y rsms-inter-fonts-3.19-3.fc36.noarch
dnf install -y vim
dnf install -y unrar
#dnf install -y smplayer smplayer-themes
dnf install -y akmod-nvidia
dnf install -y xorg-x11-drv-nvidia-cuda
# setup and install skype
#curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
#dnf install -y skypeforlinux


# setup and install vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
dnf install -y code

# setup and install docker 
#dnf -y install dnf-plugins-core
#dnf config-manager \
#   --add-repo \
#    https://download.docker.com/linux/fedora/docker-ce.repo
# dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#systemctl enable docker.service
#systemctl enable containerd.service
#systemctl start docker



# setup and install SDKMan
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

