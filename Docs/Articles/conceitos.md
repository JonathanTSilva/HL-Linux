<!-- LOGO DIREITO -->
<a href="#dicionário-do-linux"><img width="200px" src="../../Images/dictionary.png" align="right" /></a>

# Dicionário do Linux

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

📖 Dicionário do Linux, com os termos mais utilizados no ambiente.

<!-- SUMÁRIO -->
- [Dicionário do Linux](#dicionário-do-linux)
  - [1. Conceitos básicos](#1-conceitos-básicos)
    - [1.1. Shell](#11-shell)
    - [1.2. Terminal](#12-terminal)
    - [1.3. SSH](#13-ssh)
      - [1.3.1. OpenSSH](#131-openssh)
      - [1.3.2. Known Hosts](#132-known-hosts)
  - [2. Criptografia](#2-criptografia)
    - [2.1. Asymmetric Encryption](#21-asymmetric-encryption)
    - [2.2. Digest](#22-digest)
    - [2.3. Symmetric Encryption](#23-symmetric-encryption)
  - [3. Servidores](#3-servidores)
    - [3.1. DNS](#31-dns)
  - [4. Sinais do Linux](#4-sinais-do-linux)
    - [4.1. SIGINT](#41-sigint)
    - [4.2. SIGKILL](#42-sigkill)
    - [4.3. SIGTERM](#43-sigterm)
    - [4.4. SIGTSTP](#44-sigtstp)
  - [5. Utilitários de pacotes](#5-utilitários-de-pacotes)
    - [5.1. APT](#51-apt)
    - [5.2. DPGK](#52-dpgk)
    - [5.3. YUM](#53-yum)

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Conceitos básicos

### 1.1. Shell

### 1.2. Terminal

### 1.3. SSH

O SSH, também conhecido como Secure Shell ou Secure Socket Shell, é um protocolo de rede que fornece aos usuários, particularmente aos administradores de rede, um caminho seguro para acessar um computador através de uma rede não segura. Além disso, também refere-se ao conjunto de utilitários que implementam o protocolo SSH.

Provê uma forte **autenticação** de senhas e de chaves públicas, assim como a **encriptação** na comunicação de dados entre dois computadores conectados em uma rede aberto, até mesmo na internet, e a **integridade**, garantindo que os dados transmitidos cheguem inalterados. Alguns outros pontos importantes do SSH:

- Está disponível em praticamente todas as plataformas, como Linux, Mac OS X, BSD, WIndows, etc.;
- Manusear sistemas e aplicações remotamente;
- Utiliza modelo Client-Server;
- A implementação inclui suporte para protocolos de aplicação utilizados para emulação do terminal ou transferência de arquivo;
- Também pode ser utilizado para criar túneis seguros para outros protocolos de aplicativos, por exemplo, para executar com segurança sessões gráficas do X Window System remotamente;
- Um servidor SSH, por padrão, escuta na porta 22 do Protocolo de Controle de Transmissão (TCP) padrão.

#### 1.3.1. OpenSSH

O OpenSSH é uma versão gratuita do SSH. É desenvolvido pelo projeto OpenBSD, e pode ser encontrado em: [OpenSSH.com](https://www.openssh.com/).

#### 1.3.2. Known Hosts

Quando um cliente SSH se conecta a um servidor, cada um prova sua identidade ao outro. O servidor autentica o cliente e o cliente também autentica o servidor com o uso de criptografia de chave pública. Cada servidor SSH possui uma chave de identificação, chamada de `host key`, utilizada para identificar-se para os clientes.

Na primeira vez que um cliente se conecta a um host remoto, uma cópia da chave de host é armazenada em sua conta local. Assim, toda vez que o cliente se reconectar a esse host remoto, o cliente SSH verificará a identidade dele usando essa chave pública. Essa técnica ajuda a evitar, por exemplo, ataques do tipo [man-in-the-middle][1].

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Criptografia

No universo da criptografia, existem pelo menos 3 tipos de tecnologias básicas: algoritmos de Digest, de encriptação reversível e assimétrica.

### 2.1. Asymmetric Encryption

Geração de duas chaves (que costumam ser dois números primos relacionados). Uma é chamada de chave privada e a outra de chave pública.

### 2.2. Digest

Literalmente digerem qualquer blob de bits e devolvem uma impressão digital de tamanho fixo. Ex:

- MD5;
- SHA1;
- SHA512;
- BCRYPT;
- HMAC.

Pode ser passados para eles uma palavra ou diversas e sempre será retornado uma string de tamanho fixo (variando para cada tipo).

### 2.3. Symmetric Encryption

- Triple DES;
- Blowfish;
- AES.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Servidores

### 3.1. DNS

Os servidores DNS (Domain Name System, ou sistema de nomes de domínios) são os responsáveis por localizar e traduzir para números IP os endereços dos sites que digitamos nos navegadores.

Por padrão, utilizamos o serviço de DNS oferecido pelo provedor de acesso ou a empresa responsável por manter a nossa conexão funcionando, como NET, Vivo e GVT, mas não é obrigatório utilizá-lo. É possível optar por serviços que atendam melhor a nossa necessidade, oferecendo mais performance, mais segurança ou mesmo os dois, como é o caso do OpenDNS, Google Public DNS e Comodo Secure DNS.

Devido a importância do DNS é necessário garantir a sua segurança, esta fornecida pelo DNSSEC (DNS Security Extensions), esquema de criptografia que faz uso de chaves públicas e privadas para garantir a autenticidade dos endereços consultados, de forma a garantir que quando um endereço é consultado ele vai ser traduzido para o número de IP correto, evitando fraudes de internet.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 4. Sinais do Linux

[O que são os sinais do Linux](https://www.cloudsavvyit.com/11072/linux-signals-hacks-definition-and-more/)

### 4.1. SIGINT

### 4.2. SIGKILL

### 4.3. SIGTERM

### 4.4. SIGTSTP

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 5. Utilitários de pacotes

### 5.1. APT

### 5.2. DPGK

### 5.3. YUM

[1]: https://www.kaspersky.com.br/blog/what-is-a-man-in-the-middle-attack/462/
