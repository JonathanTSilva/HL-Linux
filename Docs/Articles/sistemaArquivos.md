<!-- LOGO DIREITO -->
<a href="#sistema-de-arquivos-no-linux"><img width="300px" src="../../Images/arquivos.png" align="right" /></a>

# [Sistema de arquivos no Linux][1]

💾 Entendendo, da melhor maneira, o sistema de arquivos do Linux.

<!-- SUMÁRIO -->
- [Sistema de arquivos no Linux](#sistema-de-arquivos-no-linux)
  - [Partições](#partições)

## Partições

Podemos dividir um disco rígido em várias partes ou partições, onde cada partição é independente das outras, ou seja, cada partição pode ter o seu próprio sistema de arquivo e um diferente sistema operacional. Isto significa que uma partição do disco não interfere nas outras partições.

Atualmente existem dois padrões que determinam como os dados são armazenados no disco.

- MBR (Master Boot Record) – padrão antigo que só permite 4 partições (chamadas de primárias) no mesmo disco. Por isso, costuma-se usar a quarta partição como partição estendida para criar várias partições lógicas (em outras áreas do disco).

- GPT (GUID Partition Table) – pode criar 128 ou mais partições (depende do sistema operacional usado). Neste caso, não há necessidade de criar partição estendida (embora seja possível).
  
O Linux utiliza a seguinte nomenclatura para identificar discos e partições:

<p align="center">
    <img width="500px" src="https://guialinux.uniriotec.br/wp-content/uploads/sites/28/2021/06/parti%C3%A7%C3%B5es-768x232.png" />
</p>

Por exemplo, pode-se ter:

- **/dev/sda1** – Primeira partição do primeiro disco rígido SATA ou SCSI.
- **/dev/sda2** – Segunda partição do primeiro disco rígido SATA ou SCSI.
- **/dev/sdb1** – Primeira partição do segundo disco rígido SATA ou SCSI.
- **/dev/sdb2** – Segunda  partição do segundo disco rígido SATA ou SCSI.
- **/dev/hda1** – Primeira partição do primeiro disco rígido IDE.
- **/dev/hda2** – Segunda partição do primeiro disco rígido IDE.
- **/dev/hdb1** – Primeira partição do segundo disco rígido IDE.
- **/dev/hdb2** – Segunda partição do segundo disco rígido IDE.

Em um outro exemplo abaixo, um disco de 1 TeraByte é dividido em 2 discos. O primeiro disco tem duas partições: a primeira partição com 512 MB possui o sistema EFI (Extensible Firmware Interface) que é responsável pela inicialização do sistema; a segunda partição com 931 GB possui os arquivos do sistema. O segundo disco de 119,2 GB é usado como área de dados.

- /dev/sda1 2048 1050623 1048576 512M Sistema EFI
- /dev/sda2 1050624 1953523711 1952473088 931G Linux sistema de arquivos
- /dev/sdb1 2048 250068991 250066944 119,2G Linux sistema de arquivos

O programa mais comumente usado no Linux para particionar discos é o fdisk. O problema com este aplicativo é que ele destrói os dados armazenados ao particionar o disco.

**Sistemas de arquivos**

Um sistema de arquivos é um conjunto de estruturas lógicas que permite o sistema operacional controlar o acesso a um dispositivo de armazenamento como disco rígido, pen drive, cd-room, etc. Diferentes sistemas operacionais podem usar diferentes sistemas de arquivos. Segue abaixo um resumo em tópicos sobre sistemas de arquivos:

- A partição Linux nativo é conhecida por diretório raiz do Linux e é representada por **/**;
- Atualmente, o **NTFS** (New Technology File System) é o sistema de arquivos padrão do Windows, enquanto o **ext4** é o do Linux/;
- Para verificar quais os sistemas de arquivos que o seu Linux suporta, basta verificar o conteúdo do arquivo **/proc/filesystems**;
- O suporte para diferentes sistemas de arquivos pode ser obtido através de módulos de kernel carregáveis no diretório **/lib/modules/XXX/kernel/fs**, onde XXX é a versão atual do Linux;
- A escolha do sistema de arquivos depende do sistema operacional utilizado. Abaixo, alguns exemplos de sistemas de arquivos suportados por determinados sistemas operacionais:

| Sistema Operacional | Sistema de arquivos suportados |
| :------------------ | :----------------------------- |
| Linux               | EXT3, EXT4, XFS, JFS           |
| MacOS               | HFS                            |
| Windows             | FAT, HPFS, NTFS                |
| FreeBSD, OpenBSD    | UFS                            |
| Sun Solaris         | UFS                            |
| IBM AIX             | JFS                            |

- Para ver o tipo do sistema de arquivo usado no seu Linux, basta usar o comando df.

```console
df -Tm
```

**Estrutura do Linux**

No Linux, um diretório (corresponde ao conceito de pasta do Windows) pode ter outros diretórios ou arquivos. Dizemos que um diretório é filho de outro diretório quando ele está logo abaixo do diretório em questão. O diretório que está um nível acima é chamado de diretório pai.

O diretório raiz do Linux (ou diretório /) é o diretório com maior hierarquia entre todos os diretórios do sistema. Isto significa que todos os diretórios do Linux ficam abaixo deste diretório. A seguir são apresentados exemplos de diretórios que normalmente ficam abaixo do diretório raiz.

- **bin** – diretório com os comandos disponíveis para os usuários comuns (não privilegiados);
- **boot** – diretório com os arquivos estáticos do boot de inicialização;
- **dev** – diretório com as definições dos dispositivos de entrada/saída (drivers USB, pen-drives, CD/ROM, etc). Entretanto, é mostrado apenas aqueles dispositivos que já estão montados com algum sistema de arquivos citados na versão anterior. Ao menos que esteja operando um programa de mais baixo nível, quase nunca é manuseado o diretório `/dev`, mas sim, os diretórios `/media` ou `/mnt`;
- **etc** – diretório com os arquivos de configuração do sistema;
- **home** – diretório que armazena os diretórios dos usuários do sistema;
- **lib** – diretório com as bibliotecas e módulos (carregáveis) do sistema;
- **lost+found** – é usado pelo fsck para armazenar arquivos/diretórios/devices corrompidos;
- **media** – ponto de montagem temporário para mídias removíveis;
- **mnt** – ponto de montagem temporário para sistemas de arquivos;
- **opt** – softwares adicionados pelos usuários;
- **proc** – diretório com informações sobre os processos do sistema;
- **root** – diretório home do root;
- **run** – armazena arquivos temporários da inicialização do sistema;
- **sbin** – diretório com os aplicativos (binários) usados na administração do sistema;
- **snap** – diretório com pacotes snaps (podem ser executados em diferentes distribuições Linux);
- **srv** – dados para serviços providos pelo sistema;
- **sys** – contém informações sobre  devices, drivers e características do kernel;
- **tmp** – diretório com arquivos temporários, que os sistema não garante que estará lá após o próximo boot;
- **usr**– diretório com aplicativos e arquivos utilizados pelos usuários como, por exemplo, o sistema de janelas X, jogos, bibliotecas compartilhadas, programas de usuários e de administração, etc. Significa _Unix System Resources_;
- **var** – diretório com arquivos de dados variáveis (spool - bobina de impressão, mail - para emails, log - a maioria dos logs do sistema, run - contêm os PIDs dos processos, etc).

Para ver os diretórios e arquivos que ficam abaixo do diretório /, basta usar o comando ls.

```console
ls /
```

Convém também observar que é possível colocar os subdiretórios do diretório raiz em partições separadas. O objetivo é facilitar a manutenção do sistema e aumentar a segurança dos dados. Portanto, a distribuição do diretório raiz em várias partições é uma escolha pessoal do administrador do sistema. Normalmente, é sugerido que os seguintes diretórios possuam uma partição própria: /home, /opt, /tmp, /usr e /usr/local.

Além destes diretórios padrão supracitados, ao ir para a pasta raiz do sistema (`cd /`), nota-se a existência de dois outros arquivos: **initrd.img** e **vmlinuz**. Na verdade, ambos são links simbólicos para arquivos que estão no `/boot`. O link simbólico no Linux é como um atalho no Windows. O binário **vmlinuz** é o kernel do Linux propriamente dito, ou seja, é o primeiro binário carregado logo em que a máquina iniciar. Já o **initrd.img** é o segundo binário carregado, logo na sequência, subindo um RAM DISK com os restante dos módulos.

O motivo desses arquivos dispostos na raiz do sistema serem links simbólicos é que pode-se ter kernels de múltiplas versões e alterar entre eles só alterando o nome desse (para OLD, por exemplo), para então testar outra a outra sem excluir ou modificar a anterior.

![linuxBoot][linuxBoot]

<!-- Markdown's Links -->
<!-- SITES -->
[1]: https://guialinux.uniriotec.br/sistemas-de-arquivos/

<!-- IMAGENS -->
[linuxBoot]: ../../Images/linuxBootProcess.png
