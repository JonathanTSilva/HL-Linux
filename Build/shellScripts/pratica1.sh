#!/bin/bash # Shebang

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
sudo dpkg --add-architecture i386
sudo apt update -y
sudo add-apt-repository ppa:libratbag-piper/piper-libratbag-git -y
sudo add-apt-repository ppa:lutris-team/lutris -y
sudo apt update -y
mkdir /home/jonathan/Downloads/softwares
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /home/jonathan/Downloads/softwares
wget https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb -P /home/jonathan/Downloads/softwares
sudo dpkg -i /home/jonathan/Downloads/softwares/*.deb
sudo apt -f install -y
sudo apt install snapd -y
sudo apt install winff -y
sudo apt install guvcview -y
sudo apt install virtualbox -y
sudo snap install spotify
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y