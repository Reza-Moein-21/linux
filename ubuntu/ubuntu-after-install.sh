#!/bin/sh
echo "<<Run apt-get update -y>>"
sudo apt-get update -y

echo "<<Installing vs code>>"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install code -y

echo "<<Installing Persepolis download manager>>"
sudo add-apt-repository ppa:persepolis/ppa -y
sudo apt-get update -y
sudo apt-get install persepolis -y

echo "<<Installing SmPlayer>>"
sudo add-apt-repository ppa:rvm/smplayer -y
sudo apt-get update -y
sudo apt-get install smplayer smplayer-themes smplayer-skins -y

echo "<<Installing Remmina>>"
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y
sudo apt update -y
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret -y

echo "<<Installing openfortivpn>>"
sudo apt-get install openfortivpn -y

echo "<<Installing other stuff>>"
sudo apt-get install -y curl tor htop privoxy renameutils vim unrar git gcc g++ make ffmpeg 

echo "<<Installing Nodejs 14 LTS>>"
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "<<Instaling clementine>>"
sudo add-apt-repository -y ppa:me-davidsansome/clementine
sudo apt-get update -y
sudo apt-get install clementine -y

echo "<<Installing any-desk>>"
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
sudo echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update -y
sudo apt install anydesk


echo "<<Installing obs-studio>>"
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt install obs-studio -y

echo "<<Installing Docker>>"
sudo apt-get update -y
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
    
echo "<<Gnome shortcut change>>"
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['<Super>F8']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Super>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Super>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Super>Page_Up', '<Control><Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Super>Page_Down', '<Control><Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Super><Shift>Page_Down', '<Control><Shift><Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Super><Shift>Page_Up', '<Control><Shift><Super>Up']";

if [[ $1 == -r ]]; then
     echo "<<Run reboot>>";
    reboot;
fi

