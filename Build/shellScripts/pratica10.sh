
#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# UbuntuSetup.sh - post installations of Ubuntu 20.04.
# 
# DESCRIPTION
#    This is a script to configure and prepare your Ubuntu
#    environment
#
# IMPLEMENTATION
#    version         1.0.1
#    author          Jonathan T. Silva
#    license         MIT License
#    script_id       0
# 
# CHANGELOG
#    v 1.0.0 : 2022/03/08 : JonathanTSilva
#        - Script creation
#    v 1.0.2 : 2022/04/18 : JonathanTSilva
#        - Fix some syntax problems
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva


#============================================================
#----------------------- VARIABLES --------------------------
#============================================================

# PPA
PPA_LUTRIS="ppa:lutris-team/lutris"

# DIRECTORIES
DIR_DOWNLOAD_SOFTWARES="$HOME/Downloads/Softwares"

# CORES
RED="\e[1;91m"
GREEN="\e[1;92m"
BLUE="\e[1;94m"
NO_COLOR="\e[0m"

#============================================================
#------------------------- LISTS ----------------------------
#============================================================

SOFTWARES_TO_INSTALL_DEB=(
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb # Google Chrome
    https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb # Simple Note
    https://az764295.vo.msecnd.net/stable/c722ca6c7eed3d7987c0d5c3df5c45f6b15e77d1/code_1.65.2-1646927742_amd64.deb # VSCode
    https://repo.steampowered.com/steam/archive/precise/steam_latest.deb # Steam
)

SOFTWARES_TO_INSTALL_APT=(
    guvcview
    obs-studio
    virtualbox
    anki
)

SOFTWARES_TO_INSTALL_SNAP=(
    spotify
)

#============================================================
#------------------- REQUIREMENTS TEST ----------------------
#============================================================

# INTERNET TEST
if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo -e "[ ${RED}FAIL${NO_COLOR} ] - Seu computador não tem conexão com a Internet. Verifique os adaptadores de rede, os cabos e o modem."
  exit 1
else
  echo -e "[ ${BLUE}INFO${NO_COLOR} ] - Conexão com a Internet funcionando normalmente."
fi

# WGET TEST
if [[ ! -x `which wget` ]]; then
    echo -e "[ ${BLUE}INFO${NO_COLOR} ] - O programa wget não está instalado."
    echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Instalando wget..."
    sudo apt install wget -y &> /dev/null
else
    echo -e "[ ${BLUE}INFO${NO_COLOR} ] - O programa wget já está instalado."
fi

# SNAP TEST
if [[ ! -x `which snap` ]]; then
    echo -e "[ ${BLUE}INFO${NO_COLOR} ] - O programa snap não está instalado."
    echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Instalando snap..."
    sudo apt install snapd -y &> /dev/null
else
    echo -e "[ ${BLUE}INFO${NO_COLOR} ] - O programa snap já está instalado."
fi

#============================================================
#----------------------- FUNCTIONS --------------------------
#============================================================

remove_locks () {
    echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Removendo locks..."
    sudo rm /var/lib/dpkg/lock-frontend &> /dev/null
    sudo rm /var/cache/apt/archives/lock &> /dev/null
}

add_architecture_i386 () {
    echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Adicionando arquitetura i386..."
    sudo dpkg --add-architecture i386 &> /dev/null
}

update_repos () {
    echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Atualizando repositórios..."
    sudo apt update -y &> /dev/null
}

add_ppas () {
    echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Adicionando PPAs..."
    sudo add-apt-repository "$PPA_PIPER_LIBRATBAG" -y &> /dev/null
    sudo add-apt-repository "$PPA_LUTRIS" -y &> /dev/null
}

#------------------------------------------------------------
# The ${extract_url} variable keeps the software name that 
# must be installed doing the URL parsing that is in the 
# ${SOFTWARES_TO_INSTALL_DEB}. Performs the following actions:
# 1. Keep all contents after the last URL bar (/ - bash variable expansion);
# 2. Change '-' for '_';
# 3. Take only the first column using '_' as separator.
#------------------------------------------------------------

download_and_install_deb_pkgs () {
    [[ ! -d "$DIR_DOWNLOAD_SOFTWARES" ]] && mkdir "$DIR_DOWNLOAD_SOFTWARES"
    for url in ${SOFTWARES_TO_INSTALL_DEB[@]}; do
        extract_url=$(echo -e ${url##*/} | sed 's/-/_/g' | cut -d _ -f 1)
        if ! dpkg -l | grep -iq $extract_url; then
            echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Baixando o arquivo $extract_url..."
            wget -c "$url" -P "$DIR_DOWNLOAD_SOFTWARES" &> /dev/null
            echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Instalando o $extract_url..."
            sudo dpkg -i $DIR_DOWNLOAD_SOFTWARES/${url##*/} &> /dev/null
            echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Instalando dependências..."
            sudo apt -f install -y &> /dev/null
        else 
            echo -e "[ ${BLUE}INFO${NO_COLOR} ] - O pacote $extract_url já está instalado"
        fi
    done
}

install_apt_pkgs () {
    for software in ${SOFTWARES_TO_INSTALL_APT[@]}; do
        if ! dpkg -l | grep -q $software; then
            echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Instalando o $software..."
            sudo apt install $software -y &> /dev/null
        else
            echo -e "[ ${BLUE}INFO${NO_COLOR} ] - O pacote $software já está instalado."
    	fi
    done
}

install_snap_pkgs () {
    for software in ${SOFTWARES_TO_INSTALL_SNAP[@]}; do
        if ! snap list | grep -q $software; then
            echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Instalando o $software..."
            sudo snap install $software &> /dev/null
        else
            echo -e "[ ${BLUE}INFO${NO_COLOR} ] - O pacote $software já está instalado."
        fi
    done
}

upgrade_and_clean_system () {
    echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Fazendo upgrade e limpeza do sistema..."
    sudo apt dist-upgrade -y &> /dev/null
    sudo apt autoclean &> /dev/null
    sudo apt autoremove -y &> /dev/null
}

#============================================================
#----------------------- EXECUTION --------------------------
#============================================================

remove_locks
add_architecture_i386
add_ppas
update_repos
download_and_install_deb_pkgs
install_apt_pkgs
install_snap_pkgs
upgrade_and_clean_system
