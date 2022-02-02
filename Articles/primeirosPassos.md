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
      - [Instalar o asdf](#instalar-o-asdf)
      - [Utilização do asdf](#utilização-do-asdf)
  - [5. Instalar os serviços](#5-instalar-os-serviços)
  - [6. Configurar cenário GIT](#6-configurar-cenário-git)
  - [5. Criar repositório para projetos](#5-criar-repositório-para-projetos)
  - [6. Fazer o clone de todos os repositórios do meu GitHub](#6-fazer-o-clone-de-todos-os-repositórios-do-meu-github)

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
sudo apt -y install build-essential default-jdk libssl-dev exuberant-ctags ncurses-term ack-grep silversearcher-ag fontconfig imagemagick libmagickwand-dev software-properties-common git npm vim-gtk3 curl 
```

- **build-essential** → apresenta todo o essencial para fazer builds;
- **default-jdk** → para não ter somente a jvm como compilador do java mais novo;
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
- **curl** → ferramenta em linha de comando para transferência de dados com sintaxe URL.

> **Nota:** Poderia ser instalado junto as linguagens de trabalho aqui, como python, perl, ruby. Entretanto, diferentemente das mais antigas, como C, C++ e Java, que são estáveis e alteradas com pouca frequência (sendo assim, boas para instalar via gerenciador de pacotes), essas linguagens novas se alteram com frequência (Go, JavaScript) e estes pacotes de distro Linux normalmente não acompanham de perto essas alterações, porque os objetivos são diferentes. Assim, para resolver este problema, surgiu o gerenciador de versões universal: `asdf`, que junta os gerenciadores desenvolvidos para cada versão (`gvm`, `nvm`, `rbenv`, `pyenv` e outros) em um só gerenciador.

### [asdf](https://github.com/asdf-vm/asdf)

Gerencie várias versões de tempo de execução com uma única ferramenta CLI. Adicione integrações com o asdf, com suporte para Ruby, Node.js, Elixir, Erlang e mais. O truque do asdf é utilizar variáveis de ambiente no shell, procura no `$PATH`. Como o asdf é um framework, ou seja, não tem suporte a nenhuma linguagem, em cima dele é necessário instalar plugins. Assim sendo, para cada linguagem, instale o plugin referente (confira as instruções de instalação na página de cada uma - ccrystal, elixir, erlang, golang, kotlin, nodejs, ruby, rust, entre outras).

#### Download do asdf

```zsh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
```

#### Instalar o asdf

Para cada ambiente de trabalho há uma instalação diferente. Para verificar qual o método para o seu setup, navegue na [página de instalação do asdf](http://asdf-vm.com/guide/getting-started.html#_3-install-asdf). Neste artigo, disponibilizaremos como exemplo a instalação para ZSH e Git:

1. Adicione o seguinte comando em `~/.zshrc`, ou utilize o plug-in como [asdf para oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/asdf), no caso de utilizá-lo como um framework ZSH:

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

> **Nota:** Se você estiver usando um ZSH Framework (como oh-my-), o `asdfplug-in` associado pode precisar ser atualizado para usar as novas conclusões ZSH corretamente via `fpath`. O plug-in asdf Oh-My-ZSH ainda não foi atualizado, veja [ohmyzsh/ohmyzsh#8837](https://github.com/ohmyzsh/ohmyzsh/pull/8837).

#### Utilização do asdf

Veja a [documentação de utilização do asdf](https://github.com/asdf-vm/asdf#usage) para maiores informações de como utilizar o gerenciador. Abaixo estão alguns exemplos:

```zsh
asdf plugin-add nodejs git@github.com:asdf-vm/asdf-nodejs.git # Faz o download do plugin nodejs. Para cada linguagem, há um método diferente
asdf plugin-list # Lista os plugins que estão baixados
asdf list-all nodejs # Lista todas as versões disponíveis do nodejs
asdf install nodejs 5.9.1 # Instala na máquina a versão 5.9.1. Instalar != de utilizar
nodejs -v #    Mostra a versão do nodejs instalada
asdf global nodejs 5.9.1 # Declara que está utilizando esta versão globalmente

asdf list-all nodejs 
asdf install nodejs 4.2.1
asdf local nodejs 4.2.1 # Para utilizar uma determinada versão em um determinado projeto
```

Utilize o `asdf help` para se atualizar sobre os comandos permitidos. Mesmo que os plugins atualizem as versões, pode ser necessário atualizar eles próprios. Isso pode ser feito com o comando abaixo:

```zsh
asdf plugin-update --all
```

## 5. Instalar os serviços

Tendo instalados os pacotes e linguagens em sua máquina, o próximo passo é instalar alguns serviços que mais utilizo no meu dia a dia:

```zsh
sudo apt -y install postgresql-10 postgresql-contrib postgresql-server-dev-10 redis-server libhired is-dev memcached libmemcached-dev
```

Também instalo o mongodb como banco, mas uma dica é não utilizar o mongodb como banco de dados primário, sem saber se realmente o precisa utilizar. Não só isso, podemos acabar utilizando o mongodb em situações que a melhor opção seria o postgresql.

> **Nota:** na dúvida, sempre escolha o postgresql como padrão; nunca o mongodb, nem o redis. Redis é um bom cache e o mongo é excelente para dados indiferentes, como de *analytics* ou logs.

Assim, para instalar o MongoDB, acesse o site e siga as [instruções de instalação](https://www.mongodb.com/try/download/community) para sua respectiva distribuição.

Da mesma forma que o anterior, para instalar o Docker, siga as devidas instruções no [site do docker](https://docs.docker.com/engine/install/) para correta instalação. E, assim como o MongoDB, são instaladas chaves públicas para validação dos pacotes (que são assinados digitalmente), explicando a ordem de instalação requerida (primeiro as chaves e depois os pacotes, para caso houver fraude nos pacotes)

> **Nota:** sempre preste muita atenção nas chaves que são instaladas, para que não caia em golpes de hacker. Verifique o DNS no site, para ver se é confiável, como: ` curl -fsSL https://download.docker.com/linux/ubuntu/spg | sudo apt-key add -`

Por fim, o último serviço instalado é o postgres. A melhor forma é instalá-lo em um container com o docker. Verifique a [documentação de instalação do postgres pelo docker](https://hub.docker.com/_/postgres) para completar com êxito.

## 6. Configurar cenário GIT

Visto que o download do git já foi realizado, esta etapa consiste em toda a configuração

## 5. Criar repositório para projetos

(Projects/ ou /GitHub)

## 6. Fazer o clone de todos os repositórios do meu GitHub

, com shallow;

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: 

<!-- IMAGES -->
