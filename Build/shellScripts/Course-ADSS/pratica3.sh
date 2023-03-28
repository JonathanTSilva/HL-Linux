#!/bin/bash # Shebang

#============================================================
#------------------------VARIABLES---------------------------
#============================================================

# PPA
PPA_PIPER_LIBRATBAG="ppa:libratbag-piper/piper-libratbag-git"
PPA_LUTRIS="ppa:lutris-team/lutris"

# URL
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_SIMPLE_NOTE="https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"

# DIRECTORIES
DIR_DOWNLOAD_SOFTWARES="$HOME/Downloads/softwares"

#============================================================
#------------------------FUNCTIONS---------------------------
#============================================================

remove_locks () {
    sudo rm /var/lib/dpkg/lock-frontend
    sudo rm /var/cache/apt/archives/lock
}

add_architecture_i386 () {
    sudo dpkg --add-architecture i386
}

update_repos () {
    sudo apt update -y
}

add_ppas () {
    sudo add-apt-repository "$PPA_PIPER_LIBRATBAG" -y
    sudo add-apt-repository "$PPA_LUTRIS" -y
}

install_deb_pkgs () {
    mkdir "$DIR_DOWNLOAD_SOFTWARES"
    wget "$URL_GOOGLE_CHROME" -P "$DIR_DOWNLOAD_SOFTWARES"
    wget "$URL_SIMPLE_NOTE"   -P "$DIR_DOWNLOAD_SOFTWARES"
    sudo dpkg -i $DIR_DOWNLOAD_SOFTWARES/*.deb # Não utiliza-se aspas duplas para não ser interpretado como uma string
    sudo apt -f install -y
}

install_apt_pkgs () {
    sudo apt install snapd -y
    sudo apt install winff -y
    sudo apt install guvcview -y
    sudo apt install virtualbox -y
}

install_snap_pkgs () {
    sudo snap install spotify
}

upgrade_and_clean_system () {
    sudo apt dist-upgrade -y
    sudo apt autoclean
    sudo apt autoremove -y
}

#============================================================
#------------------------EXECUTION---------------------------
#============================================================

remove_locks
add_architecture_i386
add_ppas
update_repos
install_deb_pkgs
install_apt_pkgs
install_snap_pkgs
upgrade_and_clean_system