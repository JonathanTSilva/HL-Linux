<!-- LOGO DIREITO -->
<a href="#ssh"><img width="100px" src="../../Images/ssh.png" align="right" /></a>

# SSH

:telephone_receiver: Um tutorial básico de SSH

<!-- SUMÁRIO -->
- [SSH](#ssh)
  - [O que é o SSH?](#o-que-é-o-ssh)
  - [Instalando e configurando o SSH](#instalando-e-configurando-o-ssh)
    - [Linux](#linux)
    - [Windows](#windows)

## O que é o SSH?

O SSh, também conhecido como Secure Shell ou Secure Socket Shell, é um protocolo de rede que fornece aos usuários, particularmente aos administradores de rede, um caminho seguro para acessar um computador através de uma rede não segura. Além disso, também refere-se ao conjunto de utilitários que implementar o protocolo SSH. Provê uma forte **autenticação** de senhas e de chaves públicas, assim como a **encriptação** na comunicação de dados entre dois computadores conectados em uma rede aberto, até mesmo na internet, e a **integridade**, garantindo que os dados transmitidos cheguem inalterados. Alguns outros pontos importantes do SSH:

- Está disponível em praticamente todas as plataformas, como Linux, Mac OS X, BSD, WIndows, etc.;
- Manusear sistemas e aplicações remotamente;
- Utiliza modelo Client-Server;
- A implementação inclui suporte para protocolos de aplicação utilizados para emulação do terminal ou transferência de arquivo;
- Também pode ser utilizado para criar túneis seguros para outros protocolos de aplicativos, por exemplo, para executar com segurança sessões gráficas do X Window System remotamente;
- Um servidor SSH, por padrão, escuta na porta 22 do Protocolo de Controle de Transmissão (TCP) padrão.

A figura abaixo apresenta uma arquitetura básica de uma conexão SSH:

![auth][SSH-auth]

## Instalando e configurando o SSH

### Linux

A instalação do SSH pode ser feita através do OpenSSH, uma versão gratuita do SSH. Visto que sua arquitetura é baseada no modelo Cliente-Servidor, é necessário realizar instalações de dois pacotes diferentes em suas respectivas máquinas:

- Para o servidor:

```zsh
sudo apt install openssh-server
```

- Para o cliente:

```zsh
sudo apt install openssh-client
```




### Windows

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

    - Caso pelo primeiro comando você veja que os serviços estão parados, ativá-los e adicioná-los para a inicialização automática com os seguintes:

```powershell
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
Start-Service ‘ssh-agent’
Set-Service -Name ‘ssh-agent’ -StartupType 'Automatic'
```

    - Também é preciso permitir a conexão SSH, por padrão estabelecida na porta 22, pelo Firewall do Windows. Isso pode ser feito com o seguinte comando:
  
```powershell
netsh advfirewall firewall add rule name=”SSHD service” dir=in action=allow protocol=TCP localport=22
```

    - Ou, efetivar a mesma permissão utilizando PowerShell:

```powershell
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```


<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://theitbros.com/ssh-into-windows/

<!-- IMAGES -->
[SSH-auth]: ../../Images/ssh-auth.png
[SSH-comp]: ../../Images/ssh-comp
