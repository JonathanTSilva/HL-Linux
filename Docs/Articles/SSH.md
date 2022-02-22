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
    - [3.1. Banner](#31-banner)
    - [3.2. Permitir e negar usuários](#32-permitir-e-negar-usuários)
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

### 3.1. Banner

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

### 3.2. Permitir e negar usuários

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

```powershell
scp -P 2022 jonathan@127.0.0.1:/etc/issue.net "E:\Jonathan\Downloads\"
```

> `-P <port>` = Specifies the port to connect to on the remote host. Note that this option is written with a capital 'P', because -p is already reserved for preserving the times and modes of the file in RCP;
> `-p <port>` = Preserves modification times, access times, and modes from the original file.

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://theitbros.com/ssh-into-windows/
[2]: https://manytools.org/hacker-tools/ascii-banner/

<!-- IMAGES -->
[SSH-auth]: ../../Images/ssh-auth.png
[SSH-comp]: ../../Images/ssh-comp
