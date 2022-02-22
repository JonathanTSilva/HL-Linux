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

#### Known Hosts

Quando um cliente SSH se conecta a um servidor, cada um prova sua identidade ao outro. O servidor autentica o cliente e o cliente também autentica o servidor com o uso de criptografia de chave pública. Cada servidor SSH possui uma chave de identificação, chamada de `host key`, utilizada para identificar-se para os clientes.

Na primeira vez que um cliente se conecta a um host remoto, uma cópia da chave de host é armazenada em sua conta local. Assim, toda vez que o cliente se reconectar a esse host remoto, o cliente SSH verificará a identidade dele usando essa chave pública. Essa técnica ajuda a evitar, por exemplo, ataques do tipo [man-in-the-middle][1].

## Servidores

### DNS

Os servidores DNS (Domain Name System, ou sistema de nomes de domínios) são os responsáveis por localizar e traduzir para números IP os endereços dos sites que digitamos nos navegadores.

Por padrão, utilizamos o serviço de DNS oferecido pelo provedor de acesso ou a empresa responsável por manter a nossa conexão funcionando, como NET, Vivo e GVT, mas não é obrigatório utilizá-lo. É possível optar por serviços que atendam melhor a nossa necessidade, oferecendo mais performance, mais segurança ou mesmo os dois, como é o caso do OpenDNS, Google Public DNS e Comodo Secure DNS.

Devido a importância do DNS é necessário garantir a sua segurança, esta fornecida pelo DNSSEC (DNS Security Extensions), esquema de criptografia que faz uso de chaves públicas e privadas para garantir a autenticidade dos endereços consultados, de forma a garantir que quando um endereço é consultado ele vai ser traduzido para o número de IP correto, evitando fraudes de internet.

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

[1]: https://www.kaspersky.com.br/blog/what-is-a-man-in-the-middle-attack/462/
