<!-- LOGO DIREITO -->
<a href="#rsync"><img width="200px" src="../../Images/rsync.png" align="right" /></a>

# RSYNC

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

☄ Tudo o que precisa saber para começar utilizar o **Rsync**.

<!-- SUMÁRIO -->
- [RSYNC](#rsync)
  - [1. O que é o RSYNC?](#1-o-que-é-o-rsync)
  - [2. Instalação](#2-instalação)
  - [3. Sintaxe](#3-sintaxe)
    - [3.1. Para o shell remoto](#31-para-o-shell-remoto)
  - [4. Comandos](#4-comandos)

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. O que é o RSYNC?

O Comando **Rsync** no Linux transfere e sincroniza arquivos ou diretórios de forma eficiente entre uma máquina local, outro host, um shell remoto ou qualquer combinação desses três.

Sincronizar pastas ou copiar arquivos manualmente pode consumir muito tempo. A utilidade do **Rsync** pode fazer a maior parte do trabalho adicionando recursos ótimos para economizar tempo. Também é uma ferramenta extremamente útil para realizar backups da rede.

Mesmo que você perca a conexão durante a transferência, esta ferramenta vai começar exatamente onde parou, assim que a conexão for estabelecida. Funciona como algum arquivo torrent.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Instalação

Se você não tem **Rsync** pré-instalado na sua máquina (para tal verificação, utilizar `whereis rsync`), você pode fazer isso manualmente em apenas um minuto! Em distribuições baseadas em Debian como Ubuntu você poderá usar os seguintes comandos:

```bash
$ sudo apt install rsync
```

Em distribuições baseadas em rpm como Fedora e CentOS, use os seguintes comandos:

```bash
$ sudo yum install rsync
```

No MacOS, use o seguinte comando:

```bash
$ brew install rsync
```

Pronto! O Linux **Rsync** está pronto para sincronizar dados, performar transferências de arquivos e deletar arquivos. Você pode verificar se a instalação foi realizada com sucesso usando o comando a seguir:

```bash
$ rsync -version
> rsync  version 3.1.3  protocol version 31
```

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Sintaxe

A sintaxe básica para **Rsync** funciona assim:

```bash
$ rsync <options> <src> <dest>
```

Existem algumas maneiras diferentes de usar o **Rsync** Linux. Neste exemplo, `options` indicam as ações a serem tomadas, `src` é o diretório de origem e `dest` é o diretório ou a máquina de destino.

### 3.1. Para o shell remoto

Quando você usa um shell remoto, como SSH ou RSH, a sintaxe do comando `rsync` será levemente diferente.

Para acessar o shell remoto (PULL), use o seguinte comando:

```bash
$ rsync <options> <user>@<host>:<src> <dest>
```

Para acessar o shell remoto (PUSH), use este comando:

```bash
$ rsync <options> <src> <user>@<host>:<dest>
```

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 4. Comandos

```bash
$ rsync -hv
```
verbose and human readable

Aqui está uma tabela dos comandos mais comuns usados com o rsync:

| Opção                             | Descrição                                                              |
| :-------------------------------- | :--------------------------------------------------------------------- |
| `-a, --archive`                   | Habilita o modo de arquivo (copiar também o diretório)                 |
| `-v, --verbose`                   | Dá a você uma saída visual que mostra o progresso do processo          |
| `-h, --human-readable format`     | Exibe o output num formato legível para humanos                        |
| `-z, --compress`                  | Comprime os dados dos arquivos durante a transferência                 |
| `-r`                              | Copia os dados recursivamente                                          |
| `-u, --update`                    | Opção de update, que envia apenas os arquivos diferentes (incremental) |
| `--delete`                        | Excluir no servidor todos os arquivos que não tiverem na origem        |
| `--include '...' --exclude '...'` | Incluir ou excluir algum padrão para a sincronização                   |

<!-- MARKDOWN LINKS -->
<!-- SITES -->

<!-- IMAGES -->
