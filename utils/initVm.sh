#!/bin/bash


#   ----- DOCKER INSTALLATION (https://docs.docker.com/engine/install/ubuntu/)


# DOCKER GPG KEY
sudo apt-get update
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


#   ----- GNS3 INSTALLATION (https://smnet.fr/buster/buster-6.html)


# DEPENDENCIES
sudo apt-get install -y libssl-dev libbz2-dev qtbase5-dev libqt5svg5-dev elfutils \
libelf-dev libpcap-dev cmake python3-qtpy python3-pip python3-tk sgabios \
python3-pyqt5.qtwebsockets cpulimit git tigervnc-standalone-server

# GNS3
sudo pip3 install gns3-server
sudo pip3 install gns3-gui
sudo update-mime-database /usr/local/share/mime/
sudo update-desktop-database /usr/local/share/applications/
sudo usermod -aG docker $USER

# UBRIDGE
cd /usr/local/src
sudo git clone https://github.com/GNS3/ubridge.git
cd ubridge
sudo make
sudo make install

reboot