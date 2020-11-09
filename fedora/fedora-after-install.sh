#!/bin/sh

if ! grep -q 'fastestmirror=true' /etc/dnf/dnf.conf
then
sudo echo "fastestmirror=true" >> /etc/dnf/dnf.conf;    
fi

if ! grep -q 'max_parallel_downloads=10' /etc/dnf/dnf.conf
then
sudo echo  "max_parallel_downloads=10" >> /etc/dnf/dnf.conf;
fi

if ! grep -q 'Defaults pwfeedback' /etc/sudoers
then
sudo echo "Defaults pwfeedback" >> /etc/sudoers;
fi

# WIFI - Disable Hotspot Login Screen
sudo touch /etc/NetworkManager/conf.d/20-connectivity-fedora.conf


# Update 
sudo dnf update -y;

# install rpmFution 
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;
# add some repo
sudo curl -o /etc/yum.repos.d/skype-stable.repo https://repo.skype.com/rpm/stable/skype-stable.repo;
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc;
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo';

sudo dnf update -y;

# Install common app
sudo dnf install -y vlc nodejs remmina openfortivpn java-11-openjdk java-11-openjdk-devel tor gnome-tweaks obfs4 git htop privoxy nautilus-dropbox skypeforlinux code gimp kdenlive audacity persepolis renameutils vim unrar;

# run tor and privoxy service
sudo systemctl enable tor.service
sudo systemctl start tor.service
sudo systemctl enable privoxy.service
sudo systemctl start privoxy.service

#----------------------------------------------------------------------------------------------
sudo dnf remove docker-*
sudo dnf config-manager --disable docker-*

sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=FedoraWorkstation --add-masquerade
sudo dnf install moby-engine docker-compose
sudo systemctl enable docker
sudo groupadd docker
sudo usermod -aG docker $USER
#----------------------------------------------------------------------------------------------
# add alise
if ! grep -q 'alias mv+=' /home/moein/.bashrc
then
echo alias\ mv+=\"EDITOR=\\\"code -w\\\"\ qmv\ -f\ do\" >> /home/moein/.bashrc;
fi
if ! grep -q 'alias mv+=' /root/.bashrc
then
echo alias\ mv+=\"EDITOR=\\\"code --user-data-dir /home/moein/.vscode/tmp/ -w\\\"\ qmv\ -f\ do\" >> /root/.bashrc;
fi

if ! grep -q 'export PS1=' /home/moein/.bashrc
then
echo export\ PS1=\"\\[\\e[92m\\]\\W\ \\\\$\\[\\e[m\\]\ \"  >> /home/moein/.bashrc;
fi
if ! grep -q 'export PS1=' /root/.bashrc
then
echo export\ PS1=\"\\[\\e[91m\\]\\W\ \\\\$\\[\\e[m\\]\ \" >> /root/.bashrc;
fi

#------------------------------------------------------------------
if ! grep -q 'fs.inotify.max_user_watches' /etc/sysctl.conf
then
echo fs.inotify.max_user_watches=524288 >> /etc/sysctl.conf;
fi
sudo sysctl -p
#------------------------------------------------------------------









