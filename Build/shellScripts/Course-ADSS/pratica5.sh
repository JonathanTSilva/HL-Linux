# Shebang
#!/bin/bash 

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
#--------------------------LISTS-----------------------------
#============================================================

SOFTWARES_TO_INSTALL_APT={
    snapd
    winff
    guvcview
    virtualbox
}

SOFTWARES_TO_INSTALL_SNAP={
    spotify
}

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

download_deb_pkgs () {
    [[ ! -d "$DIRETORIO_DOWNLOAD_PROGRAMAS" ]] && mkdir "$DIRETORIO_DOWNLOAD_PROGRAMAS"
    wget "$URL_GOOGLE_CHROME" -P "$DIR_DOWNLOAD_SOFTWARES"
    wget "$URL_SIMPLE_NOTE"   -P "$DIR_DOWNLOAD_SOFTWARES"
}

install_deb_pkgs () {
    sudo dpkg -i $DIR_DOWNLOAD_SOFTWARES/*.deb # Não utiliza-se aspas duplas para não ser interpretado como uma string
    sudo apt -f install -y
}

install_apt_pkgs () {
    for software in ${SOFTWARES_TO_INSTALL_APT[@]}; do
        if ! dpkg -l | grep -q $software; then
            sudo apt install $software -y;
        else
            echo "[INFO] - O pacote $software já está instalado.";
    done
}

install_snap_pkgs () {
    for software in ${SOFTWARES_TO_INSTALL_SNAP[@]}; do
        if ! snap list | grep -q $software; then
            sudo snap install $software;
        else
            echo "[INFO] - O pacote $software já está instalado.";
    done
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
download_deb_pkgs
install_deb_pkgs
install_apt_pkgs
install_snap_pkgs
upgrade_and_clean_system