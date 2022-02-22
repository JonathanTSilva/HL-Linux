<!-- LOGO DIREITO -->
<a href="#ssh"><img width="100px" src="../../Images/ssh.png" align="right" /></a>

# SSH

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

:telephone_receiver: Um tutorial básico de SSH

<!-- SUMÁRIO -->
- [SSH](#ssh)
  - [1. O que é o SSH?](#1-o-que-é-o-ssh)
  - [2. Instalando o SSH](#2-instalando-o-ssh)
    - [2.1. Linux](#21-linux)
    - [2.2. Windows](#22-windows)
  - [3. Configurando o SSH](#3-configurando-o-ssh)
  - [3.1. Autenticação por chave criptográfica](#31-autenticação-por-chave-criptográfica)
    - [3.1.1. Processo de autenticação](#311-processo-de-autenticação)
    - [3.1.2. Configuração manual](#312-configuração-manual)
    - [3.1.3. Configuração automática](#313-configuração-automática)
    - [3.1.4. Agente SSH](#314-agente-ssh)
    - [3.2. Banner](#32-banner)
    - [3.3. Permitir e negar usuários](#33-permitir-e-negar-usuários)
  - [4. Tunelamento SSH no VirtualBox](#4-tunelamento-ssh-no-virtualbox)
  - [5. Manusear arquivos](#5-manusear-arquivos)
    - [5.1. Copiar arquivos](#51-copiar-arquivos)

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. O que é o SSH?

O SSH, também conhecido como Secure Shell ou Secure Socket Shell, é um protocolo de rede que fornece aos usuários, particularmente aos administradores de rede, um caminho seguro para acessar um computador através de uma rede não segura. Além disso, também refere-se ao conjunto de utilitários que implementam o protocolo SSH.

Provê uma forte **autenticação** de senhas e de chaves públicas, assim como a **encriptação** na comunicação de dados entre dois computadores conectados em uma rede aberto, até mesmo na internet, e a **integridade**, garantindo que os dados transmitidos cheguem inalterados. Alguns outros pontos importantes do SSH:

- Está disponível em praticamente todas as plataformas, como Linux, Mac OS X, BSD, WIndows, etc.;
- Manusear sistemas e aplicações remotamente;
- Utiliza modelo Client-Server;
- A implementação inclui suporte para protocolos de aplicação utilizados para emulação do terminal ou transferência de arquivo;
- Também pode ser utilizado para criar túneis seguros para outros protocolos de aplicativos, por exemplo, para executar com segurança sessões gráficas do X Window System remotamente;
- Um servidor SSH, por padrão, escuta na porta 22 do Protocolo de Controle de Transmissão (TCP) padrão.

A figura abaixo apresenta uma arquitetura básica de uma conexão SSH:

![auth][SSH-auth]

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Instalando o SSH

### 2.1. Linux

A instalação do SSH pode ser feita através do OpenSSH, uma versão gratuita do SSH. Visto que sua arquitetura é baseada no modelo Cliente-Servidor, é necessário realizar instalações de dois pacotes diferentes em suas respectivas máquinas:

- Para o servidor:

```zsh
sudo apt install openssh-server
```

- Para o cliente:

```zsh
sudo apt install openssh-client
```

### 2.2. Windows

Já no Windows, a instalação pode ser realizada por duas maneiras, de acordo com [Cyril Kardashevsky][1], a partir da versão 1909 do sistema:

- Por interface gráfica:
  - Abra as **Configurações** $\to$ **Aplicativos** $\to$ **Aplicativos e Recursos** $\to$ **Gerenciar Recursos Opcionais** $\to$ **Adicionar um recurso** $\to$ Digite **OpenSSH**; instale o cliente ou servidor;
  - Da mesma forma ocorre para a desinstalação.

- Pelo PowerShell:
  - Há duas opções preferidas para o Windows: o OpenSSH e o Posh-SSH;
  - Para instalar o OpenSSH, siga com os seguintes comandos:

```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server* # Instalar o OpenSSH Server. Se cliente, utilize: OpenSSH.Client
Get-WindowsCapability -Online | ? Name -like 'OpenSSH.Server*' # Verificar se o Server está rodando.
Remove-WindowsCapability -Online -Name OpenSSH.Server # Desinstalar o OpenSSH Server.
```

- Configurar o serviço SSH no Windows 10 e 11:

```powershell
Get-Service -Name *ssh* # Verificar o status do ssh-agent e serviços sshd
```

Caso pelo primeiro comando você veja que os serviços estão parados, ativá-los e adicioná-los para a inicialização automática com os seguintes:

```powershell
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
Start-Service ‘ssh-agent’
Set-Service -Name ‘ssh-agent’ -StartupType 'Automatic'
```

Também é preciso permitir a conexão SSH, por padrão estabelecida na porta 22, pelo Firewall do Windows. Isso pode ser feito com o seguinte comando:
  
```powershell
netsh advfirewall firewall add rule name=”SSHD service” dir=in action=allow protocol=TCP localport=22
```

Ou, efetivar a mesma permissão utilizando PowerShell:

```powershell
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Configurando o SSH

## 3.1. Autenticação por chave criptográfica

Podemos nos conectar por senha a um servidor SSH. Porém, senhas apresentam problemas, como:

- para que uma senha seja segura, deve ser longa e aleatória (são difíceis de memorizar!);
- senhas podem ser capturadas se o host de destino for comprometido;
- os sistemas operacionais geralmente só suportam uma senha por conta de usuário, o que é um problema para contas que são compartilhadas por mais de um usuário (roo, por exemplo).

Para eliminar esses problemas, o SSH suporta autenticação de chave pública, usando chaves criptográfica.

### 3.1.1. Processo de autenticação

1. O cliente solicita uma conexão com o servidor em uma conta de usuário específica;
2. O servidor responde enviando um desafio ao cliente, para que este prove sua identidade;
3. O cliente recebe o desafio, gera um autenticador usando sua chave privada, e o envia ao servidor;
4. O servidor verifica o autenticador recebido e a conta solicitada, usando a chave pública do usuário para determinar a autenticidade da conexão, liberando ou não o acesso.

Para realizar tal processo, precisa-se de:

- Um par de chaves e um passphrase para protegê-las;
- Instalar a chave pública do usuário no servidor.

### 3.1.2. Configuração manual

Assim, tendo realizados esses pré-requisitos, siga os seguintes passos para efetuar a autenticação por chave criptográfica:

- gerar um par de chaves no cliente (neste caso, usou-se `ssh-keygen`): `ssh-keygen -t dsa/rsa`;
- transferir a chave pública do cliente de acesso para o servidor: `scp id_dsa.pub jonathan@192.168.50.23:`
- anexar o conteúdo da chave pública ao arquivo `authorized_keys`: `cat id_dsa.pub >> ~/.ssh/authorized_keys`

A autenticação de chave pública é mais segura que a autenticação por senha porque:

- são necessários dois componentes secretos - o arquivo de chave no disco e a passphrase;
- nem a passphrase nem a chave privada são enviadas ao host remoto, apenas o autenticados gerado com elas;
- chaves criptográficas geradas por computador são muito mais difíceis de adivinhar do que chaves criadas por pessoas.

### 3.1.3. Configuração automática

Assim como realizado na seção acima, há um comando que faz todo o processo de configuração de chave pública para servidor: `ssh-copy-id`.

O OpenSSH inclui um programa chamado `ssh-copy-id` que instala uma chave pública automaticamente em um servidor remoto, com apenas um comando, escrevendo no `~/.ssh/authorized_keys`

```zsh
ssh-copy-id -i <arquivo_chave> <usuário>@<servidor>
```

### 3.1.4. Agente SSH

Cada vez que conectar ao servidor SSH, precisa-se redigitar a passphrase. Porém, se utilizar o *SSH Agent*, é possível identificar-se apenas uma vez, e o ssh (e o scp) podem se "lembrar" da identidade até efetuar logout do cliente, por exemplo.

Um agente é um programa que mantém chaves privadas na memória e fornece serviços de autenticação a clientes SSH.

O agente usado pelo OpenSSH é o `ssh-agent`. Para configurá-lo, utilizar:

```zsh
eval "$(ssh-agent -s)"
> Agent pid 59566
```

```zsh
ssh-add <chave>
ssh-add -l # Verificar se a chave foi carregada
```

Caso queira excluir uma chave da memória do agente:

```zsh
ssh-add -d <chave>
```

Já para excluir todas:

```zsh
ssh-add -D
> All identities removed.
```

### 3.2. Banner

É possível customizar a mensagem de acesso ao servidor com um arquivo de banner. Seguir os seguintes passos para realizar a customização:

- O primeiro passo é ativar o banner no arquivo de configuração do **servidor ssh**. Assim, acesse `/etc/ssh/sshd_config`
- Habilite o parâmetro `Banner /etc/issue.net`;
- Reinicie o serviço do ssh com `sudo service ssh restart`;
- Edite o banner, abrindo `sudo vim /etc/issue.net`;
- Insira o texto de sua preferência. Caso deseje melhores personalizações, acesse a ferramenta [ASCII Banners][2]. Separei em alguns grupos as letras que mais me agradam (vide lista abaixo). Além disso, neste projeto há uma série de arquivos customizados para banner.

<table>
  <tr>
    <td>
      <details close>
      <summary>Minimalista</summary>
        <ul>
          <li>Calvin S</li>
          <li>JS Stick Letters</li>
          <li>Mini</li>
          <li>Script</li>
          <li>Shimrod</li>
          <li>Slant</li>
          <li>Small Script</li>
          <li>Small Slant</li>
          <li>Small</li>
          <li>Stick Letters</li>
          <li>Straight/li>
        </ul>
      </details>
      <details close>
      <summary>Caligrafia</summary>
        <ul>
          <li>Calligraphy2</li>
          <li>Fraktur</li>
        </ul>
      </details>
      <details close>
      <summary>Customizado</summary>
        <ul>
          <li>Goofy</li>
          <li>Impossible</li>
          <li>Poison</li>
        </ul>
      </details>
    </td>
  </tr>
</table>

### 3.3. Permitir e negar usuários

- AllowUsers <user1> <user2> <userN>
- DenyUsers <user1> <user2> <userN>

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 4. Tunelamento SSH no VirtualBox

<https://bobcares.com/blog/virtualbox-ssh-nat/>

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 5. Manusear arquivos

### 5.1. Copiar arquivos

A cópia de arquivos via SSH pode ser feita utilizando o programa SCP, um meio seguro de transferência de arquivos entre um servidor local e um remoto ou entre dois servidores remotos. 

> **Note:** o termo SCP pode ao mesmo tempo referir-se ao Protocolo SCP ou ao Programa SCP.

Quando feita do remoto para o servidor, a estrutura básica para essa transferência é:

```zsh
scp <arquivo> <usuário>@<servidor>:<local>
```

Já do servidor para o remoto:

```zsh
scp <usuário>@<servidor>:<arquivo> <local/arquivo> 
```

Para transferir um diretório completo, utilizar a opção `-r` no comando.

Para servidores que possuem portas diferentes da padrão (22), utilizar a opção `-P`, como no exemplo abaixo:

```powershell
scp -P 2022 jonathan@127.0.0.1:/etc/issue.net "E:\Jonathan\Downloads\"
```

> `-P <port>` = Specifies the port to connect to on the remote host. Note that this option is written with a capital 'P', because -p is already reserved for preserving the times and modes of the file in RCP;
> `-p <port>` = Preserves modification times, access times, and modes from the original file.

Há a opção também de comprimir o arquivo ou pasta antes de enviar pelo scp, com a opção `-C`. Caso queira escolher o método de criptografia a ser utilizado: `-c <método>`.

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://theitbros.com/ssh-into-windows/
[2]: https://manytools.org/hacker-tools/ascii-banner/

<!-- IMAGES -->
[SSH-auth]: ../../Images/ssh-auth.png
[SSH-comp]: ../../Images/ssh-comp
