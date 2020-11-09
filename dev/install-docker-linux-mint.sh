#!/bin/sh
sudo apt-get update -y
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"
cat /etc/apt/sources.list.d/additional-repositories.list
sudo apt-get update -y
sudo apt-get -y  install docker-ce docker-compose
sudo usermod -aG docker $USER
sudo systemctl enable docker
echo "********************************************"
echo "Docker installed successfully, please reboot"
echo "********************************************" 

