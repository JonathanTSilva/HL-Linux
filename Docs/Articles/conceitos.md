# Dicionário do Linux

## Conceitos básicos

### Shell

### Terminal

### SSH

O SSH, também conhecido como Secure Shell ou Secure Socket Shell, é um protocolo de rede que fornece aos usuários, particularmente aos administradores de rede, um caminho seguro para acessar um computador através de uma rede não segura. Além disso, também refere-se ao conjunto de utilitários que implementam o protocolo SSH.

Provê uma forte **autenticação** de senhas e de chaves públicas, assim como a **encriptação** na comunicação de dados entre dois computadores conectados em uma rede aberto, até mesmo na internet, e a **integridade**, garantindo que os dados transmitidos cheguem inalterados. Alguns outros pontos importantes do SSH:

- Está disponível em praticamente todas as plataformas, como Linux, Mac OS X, BSD, WIndows, etc.;
- Manusear sistemas e aplicações remotamente;
- Utiliza modelo Client-Server;
- A implementação inclui suporte para protocolos de aplicação utilizados para emulação do terminal ou transferência de arquivo;
- Também pode ser utilizado para criar túneis seguros para outros protocolos de aplicativos, por exemplo, para executar com segurança sessões gráficas do X Window System remotamente;
- Um servidor SSH, por padrão, escuta na porta 22 do Protocolo de Controle de Transmissão (TCP) padrão.

#### OpenSSH

O OpenSSH é uma versão gratuita do SSH. É desenvolvido pelo projeto OpenBSD, e pode ser encontrado em: [OpenSSH.com](https://www.openssh.com/).

## Criptografia

No universo da criptografia, existem pelo menos 3 tipos de tecnologias básicas: algoritmos de Digest, de encriptação reversível

### Digest

Literalmente digerem qualquer blob de bits e devolvem uma impressão digital de tamanho fixo. Ex:

- MD5;
- SHA1;
- SHA512;
- BCRYPT;
- HMAC.

Pode ser passados para eles uma palavra ou diversas e sempre será retornado uma string de tamanho fixo (variando para cada tipo).

### Symmetric Encryption

- Triple DES;
- Blowfish;
- AES.

### Asymmetric Encryption

Geração de duas chaves (que costumam ser dois números primos relacionados). Uma é chamada de chave privada e a outra de chave pública.

## Sinais do Linux

[O que são os sinais do Linux](https://www.cloudsavvyit.com/11072/linux-signals-hacks-definition-and-more/)

### SIGINT

### SIGTERM

### SIGKILL

### SIGTSTP

## Utilitários de pacotes

### DPGK

### APT
