#!/bin/sh


if ! grep -q 'Defaults pwfeedback' /etc/sudoers
then
echo "Defaults pwfeedback" >> /etc/sudoers;
fi

# Update 
apt-get update -y && apt-get upgrade -y;


# Install common app
apt-get install -y \
vlc smplayer \
code vim \
remmina openfortivpn tor obfs4 htop privoxy nautilus-dropbox skypeforlinux persepolis renameutils unrar \
gnome-tweaks gnome-shell-extension-gpaste;

# run tor and privoxy service
systemctl enable tor.service
systemctl start tor.service
systemctl enable privoxy.service
systemctl start privoxy.service

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# add alise
if ! grep -q 'alias mv+=' /home/moein/.bashrc
then
echo alias\ mv+=\"EDITOR=\\\"code -w\\\"\ qmv\ -f\ do\" >> /home/moein/.bashrc;
fi







