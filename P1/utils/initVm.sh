#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y vim make

#   ----- DOCKER INSTALLATION (https://docs.docker.com/engine/install/ubuntu/)

# DOCKER GPG KEY
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# DOCKER APT REPO
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# DOCKER PACKAGE
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#   ----- GNS3 INSTALLATION (https://docs.gns3.com/docs/getting-started/installation/linux/)

# GNS3 INSTALL
sudo add-apt-repository ppa:gns3/ppa
sudo apt update                                
sudo apt install -y gns3-gui gns3-server

# IOU SUPPORT
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y gns3-iou

sudo usermod -aG docker $USER
sudo usermod -aG wireshark $USER
reboot