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

# WIFI - Disable Hotspot Login Screen
#touch /etc/NetworkManager/conf.d/20-connectivity-fedora.conf

echo ### Configure git ####
git config --global user.name reza_moein
git config --global user.email rezamoeinpe@gmail.com


# Update 
dnf update -y;

# install rpmFution 
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;
# add some repo
curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo;
rpm --import https://packages.microsoft.com/keys/microsoft.asc;
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo';

dnf update -y;

# Install common app
dnf install -y \
vlc smplayer \
nodejs code vim \
rsms-inter-fonts google-roboto-mono-fonts papirus-icon-theme \
remmina openfortivpn tor obfs4 htop privoxy nautilus-dropbox skypeforlinux persepolis renameutils unrar file-roller \
gnome-shell-extension-appindicator gnome-tweaks gnome-shell-extension-dash-to-dock gnome-shell-extension-gpaste \
gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686;

# run tor and privoxy service
systemctl enable tor.service
systemctl start tor.service
systemctl enable privoxy.service
systemctl start privoxy.service

#----------------------------------------------------------------------------------------------
dnf -y install dnf-plugins-core
dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
groupadd docker
usermod -aG docker $USER
systemctl enable docker.service
systemctl enable containerd.service
#----------------------------------------------------------------------------------------------
# add alise
if ! grep -q 'alias mv+=' /home/moein/.bashrc
then
echo alias\ mv+=\"EDITOR=\\\"code -w\\\"\ qmv\ -f\ do\" >> /home/moein/.bashrc;
fi

if ! grep -q 'export PS1=' /home/moein/.bashrc
then
echo export\ PS1=\"\\[\\e[92m\\]\\W\ \\\\$\\[\\e[m\\]\ \"  >> /home/moein/.bashrc;
fi
if ! grep -q 'export PS1=' /root/.bashrc
then
echo export\ PS1=\"\\[\\e[91m\\]\\W\ \\\\$\\[\\e[m\\]\ \" >> /root/.bashrc;
fi








