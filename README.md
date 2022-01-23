<!-- PROJECT LOGO -->
<h1 align="center">
  <br>
  <a href="https://github.com/JonathanTSilva/HL-Linux"><img src="./Images/logo-tcc.png" alt="Logo" width="200"></a>
  <br>
  Home Lab - Linux
  <br>
</h1>

<h4 align="center">
  
🛠 Passo a passo que adoto na minha utilização do Linux.
  
</h4>

<!-- PROJECT SHIELDS -->
<p align="center">
  <a href="https://github.com/JonathanTSilva/HL-Linux/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/JonathanTSilva/HL-Linux.svg?style=for-the-badge" alt="Contributors">
  </a>
  <a href="https://github.com/JonathanTSilva/HL-Linux/network/members">
    <img src="https://img.shields.io/github/forks/JonathanTSilva/HL-Linux.svg?style=for-the-badge" alt="Members">
  </a>
  <a href="https://github.com/JonathanTSilva/HL-Linux/stargazers">
    <img src="https://img.shields.io/github/stars/JonathanTSilva/HL-Linux.svg?style=for-the-badge" alt="Stargazers">
  </a>
  <a href="https://github.com/JonathanTSilva/HL-Linux/issues">
    <img src="https://img.shields.io/github/issues/JonathanTSilva/HL-Linux.svg?style=for-the-badge" alt="Issues">
  </a>
  <a href="https://github.com/JonathanTSilva/HL-Linux/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/JonathanTSilva/HL-Linux.svg?style=for-the-badge" alt="License">
  </a>
</p>

<!-- TABLE OF CONTENTS -->
<details close="close" align="center">
  <summary><b>Table of Contents</b></summary>
          <a href="#about-the-project">About The Project</a> |
          <a href="#getting-started">Getting Started</a> |
          <a href="#quick-guide">Quick Guide</a> |
          <a href="#contributing">Contributing</a> |
          <a href="#license">License</a> |
          <a href="#contact">Contact</a>
</details>

## About the Project

## Getting Started

## Presentation

## Contributing

If you want to contribute to this project and make it better, your help is very welcome.

**How to make a clean pull request**

Look for a project's contribution instructions. If there are any, follow them.

- Create a personal fork of the project on Github.
- Clone the fork on your local machine. Your remote repo on Github is called `origin`.
- Add the original repository as a remote called `upstream`.
- If you created your fork a while ago be sure to pull upstream changes into your local repository.
- Create a new branch to work on! Branch from `develop` if it exists, else from `main`.
- Implement/fix your feature, comment your code.
- Follow the code style of the project, including indentation.
- If the project has tests run them!
- Write or adapt tests as needed.
- Add or change the documentation as needed.
- Squash your commits into a single commit with git's [interactive rebase](https://www.atlassian.com/br/git/tutorials/rewriting-history/git-rebase). Create a new branch if necessary.
- Push your branch to your fork on Github, the remote `origin`.
- From your fork open a pull request in the correct branch. Target the project's `develop` branch if there is one, else go for `main`!
- Once the pull request is approved and merged you can pull the changes from `upstream` to your local repo and delete
your extra branch(es).

> Always write your commit messages in the present tense. Your commit message should describe what the commit, when applied, does to the code – not what you did to the code.

<!-- MIT License -->
<a href="https://github.com/JonathanTSilva/HL-Linux/blob/main/LICENSE"><img width="100px" src="https://miro.medium.com/max/886/1*C87EjxGeMPrkTuVRVWVg4w.png" align="right" /></a>

## License

Distributed under the MIT License. See [LICENSE](https://github.com/JonathanTSilva/HL-Linux/blob/main/LICENSE) for more information.

## Contact
[Jonathan T. da Silva](https://www.linkedin.com/in/JonathanTSilva/) - jonathantobias2009@hotmail.com <br/>
Project Link: [JonathanTSilva/HL-Linux](https://github.com/JonathanTSilva/HL-Linux)

<!-- MARKDOWN LINKS & IMAGES -->





















<!-- Simple logo -->
<a href="#meu-guia-de-linux"><img width="100px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/1200px-Tux.svg.png" align="right" /></a>

# Meu guia de Linux

🛠 Passo a passo que adoto na minha utilização do Linux.

- [Meu guia de Linux](#meu-guia-de-linux)
  - [1. Ubuntu e Debian](#1-ubuntu-e-debian)
    - [1.1 Primeiros passos](#11-primeiros-passos)
    - [1.2. Básico](#12-básico)
      - [1.2.1. Comandos](#121-comandos)
      - [1.2.2. Atalhos](#122-atalhos)
      - [1.2.3. Conceitos](#123-conceitos)
      - [1.2.4. Manuseio de pacotes](#124-manuseio-de-pacotes)
      - [1.2.5. Manuseio de arquivos](#125-manuseio-de-arquivos)
      - [1.2.6. Customização](#126-customização)
        - [1.2.6.1. Terminal](#1261-terminal)
          - [ZSHELL - Oh-My-ZSH](#zshell---oh-my-zsh)
          - [POWERSHELL - Oh-My-Posh](#powershell---oh-my-posh)
        - [1.2.6.2. Troca de Tema](#1262-troca-de-tema)
  - [1.3. Intermediário](#13-intermediário)
    - [1.3.1. Sistemas de arquivos](#131-sistemas-de-arquivos)
  - [1.4. Avançado](#14-avançado)
    - [1.4.1. Shell Script](#141-shell-script)
    - [1.4.2. WSL](#142-wsl)

## 1. Ubuntu e Debian

### 1.1 Primeiros passos

Abaixo estão os primeiros passos adotados em uma pós formatação com o sistema com ubuntu (sem utilizar shell scripts).

a. Alterar a aparência do sistema:
    - diminuir ícones;
    - alterar wallpaper;
    - colocar foto no avatar;
    - instalar tema terceiro;
    - customizar terminal
b. Desinstalar os programas que não desejo;
c. Atualizar os pacotes e programas já instalados;
d. Instalar o Git;
e. Criar repositório para projetos;
f. Alte

### 1.2. Básico

#### 1.2.1. Comandos

| Comando                      | Descrição                                                                                          |
| :--------------------------- | :------------------------------------------------------------------------------------------------- |
| `whoami`                     | Retorna qual o usuário que está logado no sistema                                                  |
| `pwd`                        | *Print Working Directory* - Retorna onde estamos no sistema                                        |
| `mkdir <nome da pasta>`      | *Make Directory* - Criar uma nova pasta dentro do diretório atual                                  |
| `cd <diretorio>`             | *Change Directory*- Alterar para o diretório especificado                                          |
| `rm <nome do arquivo/pasta>` | Remove a pasta ou arquivo especificado                                                             |
| `chown <usuario> <arquivo>`  | *Change Owner* - Muda o dono do arquivo                                                            |
| `ls -la`                     | Lista utilizando um formato de lista longo (-l) e não ignorando as entradas que comecem com . (-a) |
| `touch <nome do arquivo>`    | Forma mais simples de criar um arquivo vazio                                                       |
| `man <comando>`              | *Manual* - Mostra um manual do comando: o que faz exatamente e quais as opções disponíveis         |
| `echo`                       | Escuta um arquivo ou váriavel do sistema. Ex: `echo $HOME`                                         |
| `clear`                      | Limpa a tela do terminal                                                                           |

**Curiosidades**

Retornar para o /home de qualquer lugar que estiver

```console
cd $HOME (variável de ambiente)
cd ~
cd
```

#### 1.2.2. Atalhos

| Atalho          | Descrição |
| :-------------- | :-------- |
| <kbd>Ctrl</kbd> |           |

#### 1.2.3. Conceitos

**Shell** - Quando fala-se shell, refere-se, na maioria dos casos, ao famoso BASH (Bourne Again SHell)

#### 1.2.4. Manuseio de pacotes

Abaixo estão alguns passos utilizados para a instalação de softwares no linux:

**I. Atualizar pacotes já instalados**

```console
sudo apt update
```

Esse comando vai atualizar a base de dados dos pacotes para que você tenha acesso às versões mais atualizadas dos softwares.

**II. Instalar por um repositório terceiro**

Se quiser instalar um programa de um repositório específico de terceiros, adicione-o usando o seguinte comando: 

```console
sudo add-apt-repository <nome do repositório>
```

**III. Caso não saiba o nome do pacote**

Caso não saiba o nome do pacote que deseja instalar, é possível procurá-lo pelo comando:

```console
apt-cache search <termo de busca>
```

Uma lista irá aparecer com todos os pacotes que correspondem com o termo em questão. Se muitos itens forem exibidos de uma só vez, digite novamente o comando e dê um espaço para navegar pela lista. Para consultar mais detalhes sobre o pacote, execute o comando `apt-cache showpkg <nome do pacote>`, que irá exibir a versão do software, dependências e outras informações.

**IV. Instalando o pacote**

```console
sudo apt install <nome do pacote>
```

Para atualizar um pacote já instalado sem precisar reinstalá-lo, use o comando:

```console
sudo apt install <nome do pacote> --only-upgrade
```

**V. Listando os pacotes instalados**

```console
sudo dpkg –list
```

O comando acima irá listar todos os pacotes instalados na máquina. Se a lista for longa demais, use a barra de espaço para navegar entre os resultados.

**VI. Deletando algum pacote**

```console
sudo apt remove <nome do pacote>
```

Essa opção vai remover os binários instalados dele (mas não os arquivos de configuração). Para remover por completo algum software, utilize:

```console
sudo apt purge <nome do pacote>
```

#### 1.2.5. Manuseio de arquivos

**I. Descompactar arquivos por um software**

O software que utilizo para descompactar arquivos no linux é o 7zip. Para baixá-lo, basta comandar:

```console
sudo apt install p7zip-full
```

Verifique se o pacote está instalado corretamente ou não usando o comando `7z`. 

**II. Descompactar arquivos por comandos raíz**

Há diversas formas de descompactar arquivos. De uma forma raíz, para cada tipo de arquivos teremos um comando resumidos pela lista abaixo:

* .zip: unzip nome_do_arquivo;
* .tar.gz ou .tgz: tar xvzf nome_do_arquivo;
* .gz: gunzip nome_do_arquivo;
* .tbz ou .tar.bz2: tar xjf nome_do_arquivo.

#### 1.2.6. Customização

##### 1.2.6.1. Terminal

Uma das maiores paixões de usuários linux é a possibilidade de customizar o terminal de acordo com sua preferência, por ser uma das ferramentas mais utilizadas dentro deste ambiente. Este tópico aborda como customizar o terminal utilizando duas tecnologias: **Oh My Zsh** (ZShell) e **Oh My Posh** (PowerShell).

###### ZSHELL - Oh-My-ZSH

**Instalando o Zsh e alterando para terminal padrão**

O primeiro passo é instalar o Zshell, que já está disponível no repositório da maioria das distribuições Linux, então fica fácil de instalar, mas caso você queria fazer de forma manual, há também a [página no GitHub][2] dele, lá você encontra informações sobre um projeto chamado “Oh My ZSH!” que vai turbinar o seu ZSH ainda mais, caso você queria extrair ainda mais do potencial da ferramenta.

No Ubuntu o processo de instalação via terminal é assim:

```console
sudo apt install zsh
```

Feito isso, o ZSH já está instalado em sua máquina. Basta conferir a versão com `zsh --version`

Para alterar o ZSH para terminal padrão do seu ambiente Linux, utilizar o comando:

```console
chsh -s /bin/zsh
```

Para testar, abra o terminal e adicione o seguinte comando: `echo $0`. Isso deve retornar `zsh`. Outra opção, é editar o arquivo **passwd** que fica dentro deste diretório:

```console
sudo gedit /etc/passwd
```

Procure pela linha `/bin/bash` do seu usuário e altere `bash` para `zsh`. Deve ter algo como: `:/home/user:/bin/zsh`. Por fim, salve o documento, feche-o e logue em uma nova sessão no terminal.

**Instalando o Oh My Zsh**

Toda a documentação mais detalhada pode ser lida na [página **Oh My Zsh** do GitHub][2].

Seguindo o tutorial fornecido por eles, podemos instalá-lo utilizando `curl`, `wget` ou outra ferramenta similar.

| Method    | Command                                                                                           |
|:----------|:--------------------------------------------------------------------------------------------------|
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |

```console
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Com isso, o Oh My Zsh estará instalado na sua máquina e assim que o terminal for aberto novamente, já estará ativado e o arquivo `.zshrc`, alterado.

**Alterando o tema e instalando temas externos**

Qualquer alteração a ser feita no Oh My Zsh, deve ser realizada dentro do arquivo `.zshrc`. Uma delas é a alteração de tema, na qual deve ser realizada alterando o valor do parâmetro a seguir com o nome das extensões fornecidas pelo zsh:

```console
ZSH_THEME="agnoster"
```

Se os temas padrão não forem do seu agrado, há a possibilidade de realizar a instalação de temas externo, desenvolvidos pela comunidade, podendo ser conferidos pela página do GitHub: [External-Links][3]. Cada um deles tem na descrição os passos para instalação e configuração. Alguns entre os mais utilizado são: zsh2000, powerlevel10k, powerlevel9k, bullet-train, classyTouch, agnosterzak, solus, blokkzh, imp. 

Para instalá-los, basta fazer o download do tema pelo GitHub, mover para a pasta `~/.oh-my-zsh/themes` e alterar a variável citada acima, dentro de `.zshrc`. Como exemplo, o download e importação do **powerlevel10k**:

```console
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
echo 'source ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

```console
ZSH_THEME="powerlevel10k/powerlevel10k"
```

:warning: **Nota:** muitos temas precisam da instalação de fontes externas para que funcione corretamente, como [Nerd Fonts][4], [Powerline Fonts][5], entre outras. Assim, abaixo está um guia rápido de instalação da biblioteca de fontes Powerline.

**Powerline fonts**

Uma instalação rápida pode ser feita com:

```console
sudo apt install fonts-powerline
```

Se não der certo, rode `.install.sh` para instalar todas Powerline fonts ou veja a documentação https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation para mais detalhes.

```console
git clone https://github.com/powerline/fonts.git --depth=1 #clone
cd fonts #install
./install.sh
sudo fc-cache -fv #refresh the font cache, saves logging out and back in
cd ..
rm -rf fonts #clean-up a bit
```

Para desinstalar, trocar `./install.sh` por `./uninstall.sh`. Após instalação, deve ser alterada a fonte no terminal que estiver utilizando, até mesmo no Visual Studio Code. No caso de um terminal GNOME, vá para `Preferences` > `Seu perfil` > `Text` > `Custom fonts` e selecione a fonte Powerline de sua preferência. Já no Visual Studio Code, basta abrir a palheta de comandos (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>) e procurar por **Preferences: Open Settings (UI)**. Ao abrir, pesquisar por **Font**, expandir o **Text Editor** e selecionar **Font**. No campo **Editor: Font Family**, acrescentar o nome da fonte de sua preferência dentro de aspas simples. Ex: `'DejaVu Sans Mono for Powerline', 'CaskaydiaCove NF', Consolas, 'Courier New', monospace`. Outro caminho para esta solução, é alterar diretamente no settings.json so VSCode, pelo parâmetro `"editor.fontFamily"`. Caso queira alterar apenas a fonte para o terminal, colocar o nome da fonte dentro do parâmetro `"terminal.integrated.fontFamily"`.


**Instalando e habilitando plugins**

Existem vários plugins que poderá usar imediatamente. Para ver a lista de plugins que por padrão estão no diretório `~/.oh-my-zsh/plugins/` execute:

```console
cd ~/.oh-my-zsh/plugins/
ls -a
```

Para configurar algum plugin já disponibilizado pelo Oh My Zsh, é necessário editar também o arquivo `~/.zshrc` adicionando ou removendo na matriz de variáveis os nomes dos plugins, por exemplo:

```console
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
)
```

Abaixo, estão alguns dos plugins mais utilizados e suas respectivas formas de instalação:

**zsh-history-substring-search** - Adiciona um histórico de pesquisa, na qual, ao digitar qualquer parte de um código, é dada asa respectivas correspondências.

```console
git clone https://github.com/zsh-users/zsh-history-substring-search.git ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
```

Agora para definir ele como um dos plugins do seu ZSH, entre em `~/.zshrc`, procure uma parte com `plugins=()` e edite:

```console
plugins=( git dnf zsh-history-substring-search )
```

**zsh-syntax-highlighting** - Adiciona syntax Highligth no nosso ZSH, facilitando você saber se o comando que está sendo digitado no momento está correto.

```console
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Assim como o plugin anterior (e todos os outros), adicione ao `~/.zshrc`:

```console
plugins=( git dnf zsh-history-substring-search zsh-syntax-highlighting )
```

**zsh-autosuggestions** - Adiciona uma auto-sugestão no ZSH baseada em seu histórico, tornando mais fácil a repetição de comandos já utilizados.

```console
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

Da mesma forma:

```console
plugins=( git dnf zsh-syntax-highlighting zsh-autosuggestions)
```

###### POWERSHELL - Oh-My-Posh

##### 1.2.6.2. Troca de Tema

Apesar de gostar do tema do Ubuntu/PopOS/ZorinOS, prefiro alterá-lo para um muito utilizado pela comunidade: Flat Remix. Por isso, este será utilizado como exemplo para alteração de tema no Ubuntu. Pode-se atualizar baixando-o pela página oficial do pacote, utilizando o gerenciador apt ou por um repositório do GitHub.

Primeiramente, é necessário baixar o Gnome Tweaks para manusear os temas:

```console
sudo apt install gnome-tweaks
```

Tendo baixado o Tweaks, basta entrar com estes comandos para instalar o Flat Remix, ou para outros temas, verificar respectivas documentações:

```console
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt update
sudo apt install flat-remix-gnome
```

Assim, iniciar o tweaks para fazer as devidas modificações.

**🏆 Melhores temas para GNOME**

* Materia
* Flat Remix

## 1.3. Intermediário

### 1.3.1. [Sistemas de arquivos][1]

**Partições**

Podemos dividir um disco rígido em várias partes ou partições, onde cada partição é independente das outras, ou seja, cada partição pode ter o seu próprio sistema de arquivo e um diferente sistema operacional. Isto significa que uma partição do disco não interfere nas outras partições.

Atualmente existem dois padrões que determinam como os dados são armazenados no disco.

* MBR (Master Boot Record) – padrão antigo que só permite 4 partições (chamadas de primárias) no mesmo disco. Por isso, costuma-se usar a quarta partição como partição estendida para criar várias partições lógicas (em outras áreas do disco).

* GPT (GUID Partition Table) – pode criar 128 ou mais partições (depende do sistema operacional usado). Neste caso, não há necessidade de criar partição estendida (embora seja possível).
  
O Linux utiliza a seguinte nomenclatura para identificar discos e partições:

![discos][discos]

Por exemplo, pode-se ter:

* **/dev/sda1** – Primeira partição do primeiro disco rígido SATA ou SCSI.
* **/dev/sda2** – Segunda partição do primeiro disco rígido SATA ou SCSI.
* **/dev/sdb1** – Primeira partição do segundo disco rígido SATA ou SCSI.
* **/dev/sdb2** – Segunda  partição do segundo disco rígido SATA ou SCSI.
* **/dev/hda1** – Primeira partição do primeiro disco rígido IDE.
* **/dev/hda2** – Segunda partição do primeiro disco rígido IDE.
* **/dev/hdb1** – Primeira partição do segundo disco rígido IDE.
* **/dev/hdb2** – Segunda partição do segundo disco rígido IDE.

Em um outro exemplo abaixo, um disco de 1 TeraByte é dividido em 2 discos. O primeiro disco tem duas partições: a primeira partição com 512 MB possui o sistema EFI (Extensible Firmware Interface) que é responsável pela inicialização do sistema; a segunda partição com 931 GB possui os arquivos do sistema. O segundo disco de 119,2 GB é usado como área de dados.

* /dev/sda1 2048 1050623 1048576 512M Sistema EFI
* /dev/sda2 1050624 1953523711 1952473088 931G Linux sistema de arquivos
* /dev/sdb1 2048 250068991 250066944 119,2G Linux sistema de arquivos

O programa mais comumente usado no Linux para particionar discos é o fdisk. O problema com este aplicativo é que ele destrói os dados armazenados ao particionar o disco.

**Sistemas de arquivos**

Um sistema de arquivos é um conjunto de estruturas lógicas que permite o sistema operacional controlar o acesso a um dispositivo de armazenamento como disco rígido, pen drive, cd-room, etc. Diferentes sistemas operacionais podem usar diferentes sistemas de arquivos. Segue abaixo um resumo em tópicos sobre sistemas de arquivos:

* A partição Linux nativo é conhecida por diretório raiz do Linux e é representada por **/**;
* Atualmente, o **NTFS** (New Technology File System) é o sistema de arquivos padrão do Windows, enquanto o **ext4** é o do Linux/;
* Para verificar quais os sistemas de arquivos que o seu Linux suporta, basta verificar o conteúdo do arquivo **/proc/filesystems**;
* O suporte para diferentes sistemas de arquivos pode ser obtido através de módulos de kernel carregáveis no diretório **/lib/modules/XXX/kernel/fs**, onde XXX é a versão atual do Linux;
* A escolha do sistema de arquivos depende do sistema operacional utilizado. Abaixo, alguns exemplos de sistemas de arquivos suportados por determinados sistemas operacionais:

| Sistema Operacional | Sistema de arquivos suportados |
| :------------------ | :----------------------------- |
| Linux               | EXT3, EXT4, XFS, JFS           |
| MacOS               | HFS                            |
| Windows             | FAT, HPFS, NTFS                |
| FreeBSD, OpenBSD    | UFS                            |
| Sun Solaris         | UFS                            |
| IBM AIX             | JFS                            |

* Para ver o tipo do sistema de arquivo usado no seu Linux, basta usar o comando df.

```console
df -Tm
```

**Estrutura do Linux**

No Linux, um diretório (corresponde ao conceito de pasta do Windows) pode ter outros diretórios ou arquivos. Dizemos que um diretório é filho de outro diretório quando ele está logo abaixo do diretório em questão. O diretório que está um nível acima é chamado de diretório pai.

O diretório raiz do Linux (ou diretório /) é o diretório com maior hierarquia entre todos os diretórios do sistema. Isto significa que todos os diretórios do Linux ficam abaixo deste diretório. A seguir são apresentados exemplos de diretórios que normalmente ficam abaixo do diretório raiz.

* **bin** – diretório com os comandos disponíveis para os usuários comuns (não privilegiados).
* **boot** – diretório com os arquivos estáticos do boot de inicialização.
* **dev** – diretório com as definições dos dispositivos de entrada/saída.
* **etc** – diretório com os arquivos de configuração do sistema.
* **home** – diretório que armazena os diretórios dos usuários do sistema.
* **lib** – diretório com as bibliotecas e módulos (carregáveis) do sistema.
* **lost+found** – é usado pelo fsck para armazenar arquivos/diretórios/devices corrompidos.
* **media** – ponto de montagem temporário para mídias removíveis.
* **mnt** – ponto de montagem temporário para sistemas de arquivos.
* **opt** – softwares adicionados pelos usuários.
* **proc** – diretório com informações sobre os processos do sistema.
* **root** – diretório home do root.
* **run** – armazena arquivos temporários da inicialização do sistema.
* **sbin** – diretório com os aplicativos usados na administração do sistema.
* **snap** – diretório com pacotes snaps (podem ser executados em diferentes distribuições Linux).
* **srv** – dados para serviços providos pelo sistema.
* **sys** – contém informações sobre  devices, drivers e características do kernel.
* **tmp** – diretório com arquivos temporários.
* **usr**– diretório com aplicativos e arquivos utilizados pelos usuários como, por exemplo, o sistema de janelas X, jogos, bibliotecas compartilhadas, programas de usuários e de administração, etc.
* **var** – diretório com arquivos de dados variáveis (spool, logs, etc).

Para ver os diretórios e arquivos que ficam abaixo do diretório /, basta usar o comando ls.

```console
ls /
```

Convém também observar que é possível colocar os subdiretórios do diretório raiz em partições separadas. O objetivo é facilitar a manutenção do sistema e aumentar a segurança dos dados. Portanto, a distribuição do diretório raiz em várias partições é uma escolha pessoal do administrador do sistema. Normalmente, é sugerido que os seguintes diretórios possuam uma partição própria: /home, /opt, /tmp, /usr e /usr/local.

## 1.4. Avançado

### 1.4.1. Shell Script

### 1.4.2. WSL

<!-- Markdown's Links -->
<!-- SITES -->
[1]: https://guialinux.uniriotec.br/sistemas-de-arquivos/
[2]: https://github.com/ohmyzsh/ohmyzsh
[3]: https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes
[4]: https://www.nerdfonts.com/
[5]: https://github.com/powerline/fonts

<!-- IMAGENS -->
[discos]: https://guialinux.uniriotec.br/wp-content/uploads/sites/28/2021/06/parti%C3%A7%C3%B5es-768x232.png
