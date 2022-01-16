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
      - [1.2.6. Troca de tema](#126-troca-de-tema)
  - [1.3. Intermediário](#13-intermediário)
    - [1.3.1. Sistemas de arquivos](#131-sistemas-de-arquivos)

## 1. Ubuntu e Debian

### 1.1 Primeiros passos

Abaixo estão os primeiros passos adotados em uma pós formatação com o sistema com ubuntu (sem utilizar shell scripts).

a. Alterar a aparência do sistema:
    - diminuir icones;
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

|Comando|Descrição|
|:---|:---|
|`whoami`|Retorna qual o usuário que está logado no sistema|
|`pwd`|*Print Working Directory* - Retorna onde estamos no sistema|
|`mkdir <nome da pasta>`|*Make Directory* - Criar uma nova pasta dentro do diretório atual|
|`cd <diretorio>`|*Change Directory*- Alterar para o diretório especificado|
|`rm <nome do arquivo/pasta>`|Remove a pasta ou arquivo especificado|
|`chown <usuario> <arquivo>`|*Change Owner* - Muda o dono do arquivo|
|`ls -la`|Lista utilizando um formato de lista longo (-l) e não ignorando as entradas que comecem com . (-a)|
|`touch <nome do arquivo>`|Forma mais simples de criar um arquivo vazio|
|`man <comando>`|*Manual* - Mostra um manual do comando: o que faz exatamente e quais as opções disponíveis|
|`echo`|Escuta um arquivo ou váriavel do sistema. Ex: `echo $HOME`|
|`clear`|Limpa a tela do terminal|

**Curiosidades**

Retornar para o /home de qualquer lugar que estiver

```console
cd $HOME (variável de ambiente)
cd ~
cd
```

#### 1.2.2. Atalhos

|Atalho|Descrição|
|:---|:---|
|<kbd>Ctrl</kbd>||

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

**II. Descompactar arquivos por um software**

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

#### 1.2.6. Troca de tema

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

* /dev/sda1 – Primeira partição do primeiro disco rígido SATA ou SCSI.
* /dev/sda2 – Segunda partição do primeiro disco rígido SATA ou SCSI.
* /dev/sdb1 – Primeira partição do segundo disco rígido SATA ou SCSI.
* /dev/sdb2 – Segunda  partição do segundo disco rígido SATA ou SCSI.
* /dev/hda1 – Primeira partição do primeiro disco rígido IDE.
* /dev/hda2 – Segunda partição do primeiro disco rígido IDE.
* /dev/hdb1 – Primeira partição do segundo disco rígido IDE.
* /dev/hdb2 – Segunda partição do segundo disco rígido IDE.

Em um outro exemplo abaixo, um disco de 1 TeraByte é dividido em 2 discos. O primeiro disco tem duas partições: a primeira partição com 512 MB possui o sistema EFI (Extensible Firmware Interface) que é responsável pela inicialização do sistema; a segunda partição com 931 GB possui os arquivos do sistema. O segundo disco de 119,2 GB é usado como área de dados.

* /dev/sda1 2048 1050623 1048576 512M Sistema EFI
* /dev/sda2 1050624 1953523711 1952473088 931G Linux sistema de arquivos
* /dev/sdb1 2048 250068991 250066944 119,2G Linux sistema de arquivos

O programa mais comumente usado no Linux para particionar discos é o fdisk. O problema com este aplicativo é que ele destrói os dados armazenados ao particionar o disco.

<!-- Markdown's Links -->
<!-- SITES -->
[1]: https://guialinux.uniriotec.br/sistemas-de-arquivos/

<!-- IMAGENS -->
[discos]: https://guialinux.uniriotec.br/wp-content/uploads/sites/28/2021/06/parti%C3%A7%C3%B5es-768x232.png