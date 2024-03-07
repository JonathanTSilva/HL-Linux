<!-- LOGO DIREITO -->
<a href="#primeiros-passos-no-linux"><img width="200px" src="https://repository-images.githubusercontent.com/190277931/44da6a00-86c7-11ea-9127-b5f051e46fe0" align="right" /></a>

# Primeiros passos no Linux

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

:foot: Passos para deixar o ambiente Linux pronto para minha utilização.

<!-- SUMÁRIO -->
- [Primeiros passos no Linux](#primeiros-passos-no-linux)
  - [1. Alterar a aparência do sistema](#1-alterar-a-aparência-do-sistema)
  - [2. Desinstalar os programas indesejados](#2-desinstalar-os-programas-indesejados)
  - [3. Atualizar os pacotes e programas](#3-atualizar-os-pacotes-e-programas)
  - [4. Instalar os compiladores e dependências](#4-instalar-os-compiladores-e-dependências)
    - [4.1. asdf](#41-asdf)
      - [4.1.1. Download do asdf](#411-download-do-asdf)
      - [4.1.2. Instalar o asdf](#412-instalar-o-asdf)
      - [4.1.3. Utilização do asdf](#413-utilização-do-asdf)
  - [5. Instalar os serviços](#5-instalar-os-serviços)
  - [6. Configurar cenário GIT](#6-configurar-cenário-git)
    - [6.1. Chave SSH](#61-chave-ssh)
    - [6.2. Configuração do Git](#62-configuração-do-git)
    - [6.3. Clonar repositórios do GitHub](#63-clonar-repositórios-do-github)
  - [7. Preparar cenário para programação](#7-preparar-cenário-para-programação)
    - [7.1. Vim e Tmux](#71-vim-e-tmux)
    - [7.2. Dotfiles](#72-dotfiles)
  - [8. Particularidade das distros](#8-particularidade-das-distros)
    - [8.1. Fedora](#81-fedora)
    - [8.1.1. RPM Fusion](#811-rpm-fusion)
    - [8.1.2. Snaps e Flatpack](#812-snaps-e-flatpack)
    - [8.1.3. COPR e DNFDragora](#813-copr-e-dnfdragora)
      - [8.1.4. Comandos gerais](#814-comandos-gerais)

Um shell script foi criado para automatizar este passo a passo. Portanto, aqui neste documento será mostrado apenas os códigos para cada etapa.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Alterar a aparência do sistema

Ao iniciar o sistema, a primeira coisa que faço é personalizar a aparência do sistema. Não que as entregues pelas distribuições são ruins, mas que sempre prefiro utilizar sistemas que tenham mais minha cara. As características que costumo alterar são:

- diminuir ícones;
- alterar wallpaper;
- colocar foto no avatar;
- instalar tema terceiro;
- customizar terminal.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Desinstalar os programas indesejados

Tendo personalizado o sistema de acordo com minha preferência, o próximo passo é a remoção de pacotes e softwares que não preciso. Geralmente, incluem:

- jogos;
- Libre Office;

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Atualizar os pacotes e programas

```zsh
sudo apt update
```

Esse comando vai atualizar a base de dados dos pacotes para que você tenha acesso às versões mais atualizadas dos softwares.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 4. Instalar os compiladores e dependências

Instalar os compiladores e todas as dependências de desenvolvimento do sistema

```zsh
sudo apt -y install build-essential default-jdk libcurl4-openssl-dev libssl-dev exuberant-ctags ncurses-term ack-grep silversearcher-ag fontconfig imagemagick libmagickwand-dev software-properties-common git npm vim-gtk3 curl htop tldr mlocate libxml2 libxml2-dev libxslt1-dev libgmp-dev zlib1g-dev libffi-dev openssh-server libldns-dev
```

- **build-essential** → apresenta todo o essencial para fazer builds;
- **default-jdk** → para não ter somente a jvm como compilador do java mais novo;
- **libcurl4-openssl-dev**
- **libssl-dev** → OpenSSL dos protocolos criptográficos SSL e TLS para comunicação segura pela Internet;
- **exuberant-ctags** → gera um arquivo de *tags* de objetos de linguagem encontrados em arquivos de origem que permite que esses itens sejam localizados de forma rápida e fácil por um editor de texto ou outro utilitário;
- **ncurses-term** → definições de tipo de terminal adicionais;
- **ack-grep** → uma versão melhorada para o procurador `grep`;
- **silversearcher-ag** → uma ferramenta de busca semelhante ao `ack`, com foco em velocidade;
- **fontconfig** → biblioteca para configurar e personalizar o acesso a fontes;
- **imagemagick** → para criar, editar, compor ou converter imagens digitais;
- **libmagickwand-dev** → bibliotecas estáticas necessárias para compilar programas usando *MagickWand*;
- **software-properties-common** → fornece uma abstração dos repositórios apt usados. Permite que você gerencie facilmente sua distribuição e fontes de software de fornecedores independentes;
- **git** → sistema de controle de versão distribuído gratuito e de código aberto projetado para lidar com tudo, desde projetos pequenos a muito grandes com velocidade e eficiência;
- **npm** → gerenciador de pacotes para o Node.JS;
- **vim-gtk3** → editor `vi` melhorado - com interface gráfica GTK3;
- **curl** → ferramenta em linha de comando para transferência de dados com sintaxe URL;
- **htop** → visualizador de processos e gerenciador de processos interativo.

> **Nota:** Poderia ser instalado junto as linguagens de trabalho aqui, como python, perl, ruby. Entretanto, diferentemente das mais antigas, como C, C++ e Java, que são estáveis e alteradas com pouca frequência (sendo assim, boas para instalar via gerenciador de pacotes), essas linguagens novas se alteram com frequência (Go, JavaScript) e estes pacotes de distro Linux normalmente não acompanham de perto essas alterações, porque os objetivos são diferentes. Assim, para resolver este problema, surgiu o gerenciador de versões universal: `asdf`, que junta os gerenciadores desenvolvidos para cada versão (`gvm`, `nvm`, `rbenv`, `pyenv` e outros) em um só gerenciador.

### 4.1. [asdf][1]

Gerencie várias versões de tempo de execução com uma única ferramenta CLI. Adicione integrações com o asdf, com suporte para Ruby, Node.js, Elixir, Erlang e mais. O truque do asdf é utilizar variáveis de ambiente no shell, procura no `$PATH`. Como o asdf é um framework, ou seja, não tem suporte a nenhuma linguagem, em cima dele é necessário instalar plugins. Assim sendo, para cada linguagem, instale o plugin referente (confira as instruções de instalação na página de cada uma - ccrystal, elixir, erlang, golang, kotlin, nodejs, ruby, rust, entre outras).

#### 4.1.1. Download do asdf

```zsh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
```

#### 4.1.2. Instalar o asdf

Para cada ambiente de trabalho há uma instalação diferente. Para verificar qual o método para o seu setup, navegue na [página de instalação do asdf][2]. Neste artigo, disponibilizaremos como exemplo a instalação para ZSH e Git:

1. Adicione o seguinte comando em `~/.zshrc`, ou utilize o plug-in como [asdf para oh-my-zsh][3], no caso de utilizá-lo como um framework ZSH:

```zsh
. $HOME/.asdf/asdf.sh
```

2. No caso de utilização pelo plug-in:

```zsh
plugins=( asdf )
```

3. As conclusões são configuradas por um plug-in do ZSH Framework asdf ou adicionando o seguinte ao seu `.zshrc`:

```zsh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
```

> **Nota:** Se você estiver usando um ZSH Framework (como oh-my-), o `asdfplug-in` associado pode precisar ser atualizado para usar as novas conclusões ZSH corretamente via `fpath`. O plug-in asdf Oh-My-ZSH ainda não foi atualizado, veja [ohmyzsh/ohmyzsh#8837][4].

#### 4.1.3. Utilização do asdf

Veja a [documentação de utilização do asdf][5] para maiores informações de como utilizar o gerenciador. Abaixo estão alguns exemplos:

```zsh
asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git # Faz o download do plugin nodejs. Para cada linguagem, há um método diferente
asdf plugin-list # Lista os plugins que estão baixados
asdf list-all nodejs # Lista todas as versões disponíveis do nodejs
asdf install nodejs 5.9.1 # Instala na máquina a versão 5.9.1. Instalar != de utilizar
nodejs -v # Mostra a versão do nodejs instalada
asdf global nodejs 5.9.1 # Declara que está utilizando esta versão globalmente

asdf list-all nodejs 
asdf install nodejs 4.2.1
asdf local nodejs 4.2.1 # Para utilizar uma determinada versão em um determinado projeto
```

Utilize o `asdf help` para se atualizar sobre os comandos permitidos. Mesmo que os plugins atualizem as versões, pode ser necessário atualizar eles próprios. Isso pode ser feito com o comando abaixo:

```zsh
asdf plugin-update --all
```

> **Nota:** algumas linguagens de programação precisam do pacote **build-essential** para serem instaladas.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 5. Instalar os serviços

Tendo instalados os pacotes e linguagens em sua máquina, o próximo passo é instalar alguns serviços que mais utilizo no meu dia a dia:

```zsh
sudo apt -y install postgresql-10 postgresql-contrib postgresql-server-dev-10 redis-server libhired is-dev memcached libmemcached-dev
```

- **postgresql-10** → ;
- **postgresql-contrib** → ;
- **postgresql-server-dev-10** → ;
- **redis-server** → ;
- **libhired** → ;
- **is-dev** → ;
- **memcached** → ;
- **libmemcached-dev** → ;

Também instalo o mongodb como banco, mas uma dica é não utilizar o mongodb como banco de dados primário, sem saber se realmente o precisa utilizar. Não só isso, podemos acabar utilizando o mongodb em situações que a melhor opção seria o postgresql.

> **Nota:** na dúvida, sempre escolha o postgresql como padrão; nunca o mongodb, nem o redis. Redis é um bom cache e o mongo é excelente para dados indiferentes, como de *analytics* ou logs.

Assim, para instalar o MongoDB, acesse o site e siga as [instruções de instalação][6] para sua respectiva distribuição.

Da mesma forma que o anterior, para instalar o Docker, siga as devidas instruções no [site do docker][7] para correta instalação. E, assim como o MongoDB, são instaladas chaves públicas para validação dos pacotes (que são assinados digitalmente), explicando a ordem de instalação requerida (primeiro as chaves e depois os pacotes, para caso houver fraude nos pacotes)

> **Nota:** sempre preste muita atenção nas chaves que são instaladas, para que não caia em golpes de hacker. Verifique o DNS no site, para ver se é confiável, como: `curl -fsSL https://download.docker.com/linux/ubuntu/spg | sudo apt-key add -`

Por fim, o último serviço instalado é o postgres. A melhor forma é instalá-lo em um container com o docker. Verifique a [documentação de instalação do postgres pelo docker][8] para completar com êxito.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 6. Configurar cenário GIT

Visto que o download do git já foi realizado, esta etapa consiste em toda a configuração de um ambiente utilizando o git como versionador de código e controlador de versões.

### 6.1. Chave SSH

O primeiro passo consiste na criação da chave SSH utilizada na estação. Verificar a subseção [3.1. Criando chave SSH][9], da documentação [Meu guia de Git][10], para maiores detalhes sobre essa criação.

Para essa criação, utilizaremos o `ssh-keygen`, que é um componente padrão do conjunto de protocolos Secure Shell para estabelecer sessões de shell seguras entre computadores remotos em redes não seguras, através da utilização de várias técnicas de criptográficas; e nestes caso, utilizando ed25519. Para isso, utilizar o comando abaixo:

```zsh
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "email"
```

As duas chaves, pública e privada, serão criadas e armazenadas na pasta `~/.ssh`.

Para que não seja preciso ficar colocando a senha da  chave toda hora, é necessário ter um serviço em execução chamado: `ssh-agent`. Para ativar e verificar se está rodando, utilizar o comando abaixo:

```zsh
eval "$(ssh-agent -s)"
echo "$(ssh-agent -s)" # ou `echo $SSH_AGENT_PID`
```

Estando em execução, adicionar sua chave no agente com:

```zsh
ssh-add ~/.ssh/id_ed25519
```

### 6.2. Configuração do Git

O segundo passo é configurar o seu git cadastrando o email e o nome do usuário. Logo, executar os seguintes comandos:

```zsh
git config --global user.name "nome"
git config --global user.email "email"
```

> **Nota:** o email cadastrado no seu git local também deve estar cadastrado no seu repositório, para que sejam validadas as contribuições

### 6.3. Clonar repositórios do GitHub

Fazer o clone de todos os repositórios do meu GitHub, com git clone shallow;

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 7. Preparar cenário para programação

Um setup muito comum entre os programadores é a utilização do **Vim** como editor de texto, o **Tmux**, um multiplexer de terminal, tilix, zsh, entre outros dotfiles que variam de acordo com as preferências.

### 7.1. Vim e Tmux

```zsh
sudo apt install vim-gtk3 
```

O básico de vim é que ele tem dois modos: o de edição e o de comando. Sempre está no modo de comando, mas apertando a tecla <kbd>i</kbd> (*insert*) ou <kbd>a</kbd> (*append*). Edite o seu texto e ao término, aperte <kbd>ESC</kbd> para retornar ao modo de comando. Para maiores informações sobre comandos no Vim, verificar o cheatsheet de Vim, da minha página no GitHub.

Feito isso, é preciso alterar o editor padrão do seu terminal, com o seguinte comando:

```zsh
sudo update-alternatives --config editor
```

Para instalar o Tmux:

```zsh
sudo apt install tmux
```

Para o Tmux, liste as sessões ativas com:

```zsh
tmux ls
```

Por isso a importância de aprender Vim e Tmux pelo menos, e utilizá-los em seu ambiente de programação: da próxima vez que precisar se conectar em um servidor remoto para fazer alguma atividade longa, abra um Tmux e edite no Vim, pois se por acaso der *crash* na sua máquina local, ou algum problema na sua conexão com o servidor, você não vai perder nada do que estava fazendo no servidor; basta reconectar quando puder e dar *attach* na *session* que estava utilizando:

```zsh
tmux attach-session -t <nº> 
```

Por outro lado, se quiser fechar tudo que estava aberto naquela sessão, utilizar:

```zsh
tmux kill-session -t <nº>
```

### 7.2. Dotfiles

```zsh
sudo apt install tilix zsh
```

<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 8. Particularidade das distros

### 8.1. Fedora

### 8.1.1. RPM Fusion

Inicialmente, no Fedora, é preciso instalar e habilitar o repositório externo RPM Fusion. Segundo o próprio [site do projeto][11], o RPM Fusion é um repositório que distribui softwares que a Red Hat e o Projeto Fedora não querem disponibilizar em seus repositórios próprios, em sua maioria por questões de licença, visto que a Red Hat só disponibiliza softwares open source.  

Todos os softwares presentes no RPM Fusion já estão pré-compilados em formato RPM, necessitando apenas pesquisar na loja do sistema, ou digitar um único comando no terminal.  

O RPM Fusion nasceu como uma junção de outros 3 repositórios: Dribble, Freshrpms e Livna, na intenção de distribuir a maior quantidade de softwares possíveis em um único local.

Para instalar o RPM Fusion é bem simples. Basta ir à [página de configuração][12] do projeto, baixar os dois arquivos dele: **free** e **nonfree**, e instalar em sua máquina. Ou, caso prefira, realizar os procedimentos via terminal:

```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

Para visualizar os aplicativos do RPM Fusion diretamente da loja, basta inserir o seguinte comando e depois reiniciar o sistema:

```bash
sudo dnf groupupdate core
```

Pronto! Feito isso, você terá acesso a todos os softwares do RPM Fusion através da loja ou do próprio terminal.  

Para atualizar o seu sistema, seguir com o comando:

```bash
sudo dnf update
```

### 8.1.2. Snaps e Flatpack

Já para ativar o suporte à **snaps** e **flatpacks** provindos do **flathub** (para saber mais sobre essas e outras tecnologias, confira esse [artigo][13]), é necessário apenas ativar o suporte ao **flathub** para a segunda opção, visto que o Fedora já traz instalado o **flatpack**. Esta instalação pode ser verificada pelo [site da organização][14], em *Quick setup* e escolhendo o Fedora na próxima janela. Basta copiar o comando, colar e executar em seu terminal.

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Em seguida, precisa-se matar o processo e reiniciá-lo para que a feature nova do **flathub** seja carregada na loja do Fedora (na opção **source** de cada pacote).

```bash
killall gnome-software
```

O Snapcraft pode ser instalado também pela [página do projeto][15], selecionando a opção Fedora, e da mesma forma que o anterior: copiar, colar e executar o comando de instalação.

```bash
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
```

Feito isso, a sua estação já está com suporte para snaps. Entretanto, não há uma loja nativa para gerenciar esses pacotes no Fedora, sendo necessária instalação da **snap-store**:

```bash
snap install snap-store
```

### 8.1.3. COPR e DNFDragora

**Copr** é um sistema de compilação automática fácil de usar que fornece um repositório de pacotes como saída. Ele está para o Fedora, assim como os **PPAs** estão para o Ubuntu. Da mesma forma, os pacotes RMP para o Fedora, os DEB para Ubuntu e EXE para Windows.

Para ativar um repositório COPR é simples:

1. Procure pelo seu repositório/pacote na página [do projeto COPR][16];
2. Copie o código exibido na barra lateral direita;
3. Cole e execute este comando no terminal.

Basicamente, a estrutura dos comandos para adicionar um novo repositório é a mesma:

```bash
dns copr enable <nome>/<repositório>
```

Para remover um repositório COPR, digite o comando:

```bash
dnf copr remove <nome>/<repositório>
```

Uma vez que um repositório COPR é ativado, os pacotes presentes naquele repositório podem ser instalados via terminal ou via **DNFDragora**. O **DNFDragora** está para o Fedora, assim como o **Synaptic** está para o Ubuntu, que são gerenciadores de pacotes. Pode ser instalado pela loja ou pelo comando:

```bash
sudo dnf install dnfdragora
```

#### 8.1.4. Comandos gerais

A tabela abaixo apresenta os comandos mais utilizados pelo terminal para gerenciar o sistema Fedora:

| Comando                     | Descrição                                                                                 |
| :-------------------------- | :---------------------------------------------------------------------------------------- |
| `sudo dnf update`           | Atualiza o sistema Fedora                                                                 |
| `dnf search <string>`       | Pesquisa por algum pacote que contenha a string passada                                   |
| `sudo dnf install <pacote>` | Instala o pacote                                                                          |
| `sudo dnf remove <pacote>`  | Remove o pacote                                                                           |
| `dnf info <pacote>`         | Mostra informações do pacote                                                              |
| `sudo dnf autoremove`       | Remove dependências desnecessárias do sistema                                             |
| `sudo dnf distro-sync`      | Sincroniza a lista de softwares instalados com a lista dos repositórios ativos no momento |

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://github.com/asdf-vm/asdf
[2]: http://asdf-vm.com/guide/getting-started.html#_3-install-asdf
[3]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf
[4]: https://github.com/ohmyzsh/ohmyzsh/pull/8837
[5]: https://github.com/asdf-vm/asdf#usage
[6]: https://www.mongodb.com/try/download/community
[7]: https://docs.docker.com/engine/install/
[8]: https://hub.docker.com/_/postgres
[9]: https://github.com/JonathanTSilva/HL-Git#31-criando-chave-ssh
[10]: https://github.com/JonathanTSilva/HL-Git
[11]: https://rpmfusion.org/
[12]: https://rpmfusion.org/Configuration
[13]: https://diolinux.com.br/flatpak/qual-o-melhor-appimage-flatpak-ou-snap.html
[14]: https://flatpak.org/
[15]: https://snapcraft.io/docs/installing-snapd
[16]: https://copr.fedorainfracloud.org/

<!-- IMAGES -->
