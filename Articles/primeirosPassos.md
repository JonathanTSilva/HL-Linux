<!-- RIGHT LOGO -->
<a href="#primeiros-passos-no-linux"><img width="200px" src="https://repository-images.githubusercontent.com/190277931/44da6a00-86c7-11ea-9127-b5f051e46fe0" align="right" /></a>

# Primeiros passos no Linux

:foot: Passos para deixar o ambiente Linux pronto para minha utilização.

<!-- TABLE OF CONTENTS -->
- [Primeiros passos no Linux](#primeiros-passos-no-linux)
  - [1. Alterar a aparência do sistema](#1-alterar-a-aparência-do-sistema)
  - [2. Desinstalar os programas indesejados](#2-desinstalar-os-programas-indesejados)
  - [3. Atualizar os pacotes e programas](#3-atualizar-os-pacotes-e-programas)
  - [4. Instalar os compiladores e dependências](#4-instalar-os-compiladores-e-dependências)
    - [asdf](#asdf)
      - [Download do asdf](#download-do-asdf)
      - [Instalar o ASDF](#instalar-o-asdf)
  - [5. Criar repositório para projetos](#5-criar-repositório-para-projetos)
  - [6. Fazer o clone de todos os repositórios do meu GitHub](#6-fazer-o-clone-de-todos-os-repositórios-do-meu-github)
    - [Installation](#installation)
    - [Usage](#usage)

Um shell script foi criado par automatizar este passo a passo. Portanto,aqui neste documento será  mostrado apenas os códigos para cada etapa.

## 1. Alterar a aparência do sistema

Ao iniciar o sistema, a primeira coisa que faço é personalizar a aparência do sistema. Não que as entregues pelas distribuições são ruins, mas que sempre prefiro utilizar sistemas que tenham mais minha cara. As características que costumo alterar são:

- diminuir ícones;
- alterar wallpaper;
- colocar foto no avatar;
- instalar tema terceiro;
- customizar terminal.

## 2. Desinstalar os programas indesejados

Tendo personalizado o sistema de acordo com minha preferência, o próximo passo é a remoção de pacotes e softwares que não preciso. Geralmente, incluem:

- jogos;
- Libre Office;

## 3. Atualizar os pacotes e programas

```zsh
sudo apt update
```

Esse comando vai atualizar a base de dados dos pacotes para que você tenha acesso às versões mais atualizadas dos softwares.

## 4. Instalar os compiladores e dependências

Instalar os compiladores e todas as dependências de desenvolvimento do sistema

```zsh
sudo apt install build-essential default-jdk libssl-dev exuberant-ctags ncurses-term ack-grep silversearcher-ag fontconfig imagemagick libmagickwand-dev software-properties-common git npm vim-gtk3 curl -y
```

- build-essential → apresenta todo o essencial para fazer builds;
- default-jdk → para ão ter somente a jvm como compilador do java mais novo;
- libssl-dev →
- exuberant-ctags →
- ncurses-term →
- ack-grep →
- silversearcher-ag →
- fontconfig →
- imagemagick →
- libmagickwand-dev →
- software-properties-common →
- git →
- npm →
- vim-gtk3 →
- curl →

> **Nota:** Poderia ser instalado junto as linguagens de trabalho aqui, como python, perl, ruby. Entretanto, diferentemente das mais antigas, como C, C++ e Java, que são estáveis e alteradas com pouca frequência (sendo assim, boas para instalar via gerenciador de pacotes), essas linguagens novas se alteram com frequência (Go, JavaScript) e estes pacotes de distro Linux normalmente não acompanham de perto essas alterações, porque os objetivos são diferentes. Assim, para resolver este problema, surgiu o gerenciador de versões universal: `asdf`, que junta os gerenciadores desenvolvidos para cada versão (`gvm`, `nvm`, `rbenv`, `pyenv` e outros) em um só gerenciador.

### asdf

Gerencie várias versões de tempo de execução com uma única ferramenta CLI. Adicione integrações com o [asdf](https://github.com/asdf-vm/asdf),sion manager, with support for Ruby, Node.js, Elixir, Erlang and more.

#### Download do asdf

```zsh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0 # download
```

#### Instalar o ASDF

Adds integration with [asdf](https://github.com/asdf-vm/asdf), the extendable version manager, with support for Ruby, Node.js, Elixir, Erlang and more.

## 5. Criar repositório para projetos

(Projects/ ou /GitHub)

## 6. Fazer o clone de todos os repositórios do meu GitHub

, com shallow;

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: 

<!-- IMAGES -->












Adds integration with [asdf](https://github.com/asdf-vm/asdf), the extendable version manager, with support for Ruby, Node.js, Elixir, Erlang and more.

### Installation

1. Enable the plugin by adding it to your `plugins` definition in `~/.zshrc`.

```zsh
plugins=(asdf)
```

2. [Install asdf](https://github.com/asdf-vm/asdf#setup) by running the following:

```zsh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
```

### Usage

See the [asdf usage documentation](https://github.com/asdf-vm/asdf#usage) for information on how to use asdf:

```zsh
asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git
asdf install nodejs 5.9.1
```
