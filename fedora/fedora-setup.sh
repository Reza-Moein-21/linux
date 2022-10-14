sudo dnf update -y
sudo dnf install -y audacity
sudo dnf install -y gimp
sudo dnf install -y persepolis
sudo dnf install -y remmina
sudo dnf install -y geary
sudo dnf install -y vlc
sudo dnf install -y gnome-tweaks
# setup and install skype
sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo
sudo dnf install -y skypeforlinux

sudo dnf install -y nodejs
# setup and install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code

# setup and install docker 
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo systemctl start docker

sudo dnf install -y openfortivpn

# setup and install SDKMan
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
sudo dnf install -y rsms-inter-fonts-3.19-3.fc36.noarch
sudo dnf install -y vim
sudo dnf install -y unrar
sudo dnf install -y smplayer smplayer-themes
sudo dnf install -y akmod-nvidia
sudo dnf install -y xorg-x11-drv-nvidia-cuda
