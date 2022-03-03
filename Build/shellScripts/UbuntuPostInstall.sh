#!/usr/bin/env bash
#
# pos_instalacao_ubuntu.sh - Faz a pós configuração do Ubuntu 19.10.
#
# Website:       https://4fasters.com.br
# Autor:         Mateus Gabriel Müller
#
# ------------------------------------------------------------------------ #
# O QUE ELE FAZ?
# Esse script instalar os programas que utilizo após a instalação, faz upgrade
# e limpeza do sistema. É de fácil expensão (mudar variáveis).
#
# COMO USAR?
#   $ ./pos_instalacao_ubuntu
#
# ------------------------------------------------------------------------ #
# Changelog:
#
#   v1.0 30/11/2019, Mateus Müller:
#     - Primeira versão com poucos programas
#
# ------------------------------------------------------------------------ #
#
# -------------------------------VARIÁVEIS----------------------------------------- #
PPA_PIPER_LIBRATBAG="ppa:libratbag-piper/piper-libratbag-git"
PPA_LUTRIS="ppa:lutris-team/lutris"
DIRETORIO_DOWNLOAD_PROGRAMAS="$HOME/Downloads/programas"
PROGRAMAS_PARA_INSTALAR_DEB=(
  https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb
  https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.0.20.40428-bionic_amd64.deb
)
PROGRAMAS_PARA_INSTALAR_APT=(
  snapd
  winff
  guvcview
  virtualbox
  xtail
)
PROGRAMAS_PARA_INSTALAR_SNAP=(
  spotify
  postman
)
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'
# -------------------------------------------------------------------------------- #

# -------------------------------TESTES----------------------------------------- #
# Internet conectando?
if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo -e "${VERMELHO}[ERROR] - Seu computador não tem conexão com a Internet. Verifique os cabos e o modem.${SEM_COR}"
  exit 1
else
  echo -e "${VERDE}[INFO] - Conexão com a Internet funcionando normalmente.${SEM_COR}"
fi

# wget está instalado?
if [[ ! -x $(which wget) ]]; then
  echo -e "${VERMELHO}[ERRO] - O programa wget não está instalado.${SEM_COR}"
  echo -e "${VERDE}[INFO] - Instalando o wget...${SEM_COR}"
  sudo apt install wget -y &> /dev/null
else
  echo -e "${VERDE}[INFO] - O programa wget já está instalado.${SEM_COR}"
fi
# ------------------------------------------------------------------------------ #

# -------------------------------FUNÇÕES----------------------------------------- #
remover_locks () {
  echo -e "${VERDE}[INFO] - Removendo locks...${SEM_COR}"
  sudo rm /var/lib/dpkg/lock-frontend &> /dev/null
  sudo rm /var/cache/apt/archives/lock &> /dev/null
}

adicionar_arquitetura_i386 () {
  echo -e "${VERDE}[INFO] - Adicionando arquitetura i386...${SEM_COR}"
  sudo dpkg --add-architecture i386 &> /dev/null
}

atualizar_repositorios () {
  echo -e "${VERDE}[INFO] - Atualizando repositórios...${SEM_COR}"
  sudo apt update &> /dev/null
}

adicionar_ppas () {
  echo -e "${VERDE}[INFO] - Adicionando PPAs...${SEM_COR}"
  sudo apt-add-repository "$PPA_PIPER_LIBRATBAG" -y &> /dev/null
  sudo add-apt-repository "$PPA_LUTRIS" -y &> /dev/null
  atualizar_repositorios
}

########################################################
# A variável "url_extraida" manter o nome do programa
# que deve ser instalado, fazendo o parsing da URL que
# está no array PROGRAMAS_PARA_INSTALAR_DEB.
# 1. Vai manter tudo após a última barra da URL (bash variable expansion)
# 2. Vai trocar - por _
# 3. Vai pegar somente a coluna um, usando o _ como separador.
########################################################
baixar_pacotes_debs () {
  [[ ! -d "$DIRETORIO_DOWNLOAD_PROGRAMAS" ]] && mkdir "$DIRETORIO_DOWNLOAD_PROGRAMAS"
  for url in ${PROGRAMAS_PARA_INSTALAR_DEB[@]}; do
    url_extraida=$(echo -e ${url##*/} | sed 's/-/_/g' | cut -d _ -f 1)
    if ! dpkg -l | grep -iq $url_extraida; then
      echo -e "${VERDE}[INFO] - Baixando o arquivo $url_extraida...${SEM_COR}"
      wget -c "$url" -P "$DIRETORIO_DOWNLOAD_PROGRAMAS" &> /dev/null
      echo -e "${VERDE}[INFO] - Instalando o $url_extraida...${SEM_COR}"
      sudo dpkg -i $DIRETORIO_DOWNLOAD_PROGRAMAS/${url##*/} &> /dev/null
      echo -e "${VERDE}[INFO] - Instalando dependências...${SEM_COR}"
      sudo apt -f install -y &> /dev/null
    else
      echo -e "${VERDE}[INFO] - O programa $url_extraida já está instalado.${SEM_COR}"
    fi
  done
}

instalar_pacotes_do_apt () {
  for programa in ${PROGRAMAS_PARA_INSTALAR_APT[@]}; do
    if ! dpkg -l | grep -q $programa; then
      echo -e "${VERDE}[INFO] - Instalando o $programa...${SEM_COR}"
      sudo apt install $programa -y &> /dev/null
    else
      echo -e "${VERDE}[INFO] - O pacote $programa já está instalado.${SEM_COR}"
    fi
  done
}

instalar_pacotes_do_snap () {
  for programa in ${PROGRAMAS_PARA_INSTALAR_SNAP[@]}; do
    if ! snap list | grep -q $programa; then
      echo -e "${VERDE}[INFO] - Instalando o $programa...${SEM_COR}"
      sudo snap install $programa &> /dev/null
    else
      echo -e "${VERDE}[INFO] - O pacote $programa já está instalado.${SEM_COR}"
    fi
  done
}

upgrade_e_limpa_sistema () {
  echo -e "${VERDE}[INFO] - Fazendo upgrade e limpeza do sistema...${SEM_COR}"
  sudo apt dist-upgrade -y &> /dev/null
  sudo apt autoclean &> /dev/null
  sudo apt autoremove -y &> /dev/null
}
# ------------------------------------------------------------------------------ #

# -------------------------------EXECUÇÃO----------------------------------------- #
remover_locks
adicionar_arquitetura_i386
adicionar_ppas
baixar_pacotes_debs
instalar_pacotes_do_apt
instalar_pacotes_do_snap
upgrade_e_limpa_sistema
# ------------------------------------------------------------------------------ #
