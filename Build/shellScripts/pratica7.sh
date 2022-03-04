# Shebang
#!/bin/bash 

#============================================================
#------------------------VARIABLES---------------------------
#============================================================

# PPA
PPA_PIPER_LIBRATBAG="ppa:libratbag-piper/piper-libratbag-git"
PPA_LUTRIS="ppa:lutris-team/lutris"

# DIRECTORIES
DIR_DOWNLOAD_SOFTWARES="$HOME/Downloads/softwares"

#============================================================
#--------------------------LISTS-----------------------------
#============================================================

SOFTWARES_TO_INSTALL_DEB=(
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb # Google Chrome
    https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb # Simple Note
)

SOFTWARES_TO_INSTALL_APT=(
    snapd
    winff
    guvcview
    virtualbox
)

SOFTWARES_TO_INSTALL_SNAP=(
    spotify
)

#============================================================
#--------------------REQUIREMENTS TEST-----------------------
#============================================================

# INTERNET TEST
if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo "[ERROR] - Seu computador não tem conexão com a Internet. Verifique os adaptadores de rede, os cabos e o modem."
  exit 1
else
  echo "[INFO] - Conexão com a Internet funcionando normalmente."
fi

# WGET
if [[ ! -x `which wget` ]]; then
    echo "[INFO] - O programa wget não está instalado."
    echo "[INFO] - Instalando wget..."
    sudo apt install wget -y
else
    echo "[INFO] - O programa wget já está instalado."
fi

# SNAP
if [[ ! -x `which snap` ]]; then
    echo "[INFO] - O programa snap não está instalado."
    echo "[INFO] - Instalando snap..."
    sudo apt install snap -y
else
    echo "[INFO] - O programa snap já está instalado."
fi

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

download_and_install_deb_pkgs () {
    [[ ! -d "$DIRETORIO_DOWNLOAD_PROGRAMAS" ]] && mkdir "$DIRETORIO_DOWNLOAD_PROGRAMAS"
    for url in %{SOFTWARES_TO_INSTALL_DEB[@]}; do
        extract_url=$(echo ${url##*/} | sed 's/-/_/g' | cut -d _ -f 1)
        if ! dpkg -l | grep -iq $extract_url; then
            wget -c "$url" -P "$DIR_DOWNLOAD_SOFTWARES"
            sudo dpkg -i $DIR_DOWNLOAD_SOFTWARES/${url##*/}
            sudo apt -f install -y
        else 
            echo "[INFO] - O pacote $extract_url já está instalado"
        fi
    done
}

install_apt_pkgs () {
    for software in ${SOFTWARES_TO_INSTALL_APT[@]};
        if ! dpkg -l | grep -q $software; then
            sudo apt install $software -y;
        else
            echo "[INFO] - O pacote $software já está instalado.";
    done
}

install_snap_pkgs () {
    for software in ${SOFTWARES_TO_INSTALL_SNAP[@]};
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
download_and_install_deb_pkgs
install_apt_pkgs
install_snap_pkgs
upgrade_and_clean_system