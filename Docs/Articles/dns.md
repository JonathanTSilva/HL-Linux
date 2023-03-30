<!-- LOGO DIREITO -->
<a href="#como-adicionar-dns-ao-meu-servidor"><img width="200px" src="../../Images/dns.png" align="right" /></a>

# O que é necessário saber sobre DNS

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

🌐 Tutoriais para adicionar um domínio (*Domain Name System*) aos IPs do servidor, criar o próprio DNS e muito mais para garantir melhorias de velocidade, confiabilidade e segurança ao seu servidor.

<!-- SUMÁRIO -->
- [O que é necessário saber sobre DNS](#o-que-é-necessário-saber-sobre-dns)
  - [1. Como adicionar DNS ao meu servidor?](#1-como-adicionar-dns-ao-meu-servidor)
    - [1.1. Pré-requisitos](#11-pré-requisitos)
    - [1.2. Apache](#12-apache)
    - [1.3. Nginx](#13-nginx)
  - [2. Como criar meu próprio servidor DNS?](#2-como-criar-meu-próprio-servidor-dns)
    - [2.1. No Ubuntu Server](#21-no-ubuntu-server)
      - [Instalações](#instalações)
      - [Configuração](#configuração)
      - [Overview](#overview)
      - [Caching nameserver](#caching-nameserver)
      - [Primary server](#primary-server)
        - [Forward Zone File](#forward-zone-file)
        - [Reverse Zone File](#reverse-zone-file)
      - [Secondary Server](#secondary-server)
    - [2.2. Em um container](#22-em-um-container)

**Domain Name Service (DNS)** é um serviço de Internet que mapeia endereços IP e **fully qualified domain names (FQDN)** entre si. Desta forma, o DNS alivia a necessidade de lembrar endereços IP. Os computadores que executam o DNS são chamados de servidores de nomes.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Como adicionar DNS ao meu servidor?

### 1.1. Pré-requisitos

Para que você consiga reproduzir os passos abaixo para seu servidor, vale ressaltar que há algumas etapas anteriores a serem feitas:

1. **Tornar o IP do servidor estático:** isso vai ajudar ao alocar o nome de domínio que você comprou ou conseguiu de forma gratuita ao seu servidor, visto que caso esteja com DHCP, o IP irá alterar frequentemente, e será necessário linkar o novo ao domínio;
2. **Linkar o IP ao domínio adquirido:** ao efetuar a aquisição de um domínio, não esqueça de conectá-lo ao IP do seu servidor.

### 1.2. Apache

> **Nota:** para alterar o local padrão de execução do servidor (*default* = `/var/www/html`), é necessário alterar inicialmente o arquivo `/etc/apache2/apache2.conf` (replicando as configurações do diretório padrão para o seu novo) e depois, utilizá-lo em `/etc/apache2/sites-available/000-default.conf`

No servidor Apache, é possível atribuir um domínio ao endereço de IP do servidor da seguinte forma:

1. Edite o arquivo de configuração do Apache: `vim /etc/apache2/sites-available/000-default.conf`;
2. Adicione o Diretório da sua aplicação, alterando o parâmetro `AllowOverride` para `All`:

```config
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /srv/www/
        ServerName smarbt.myvnc.com
        ServerAlias www.smarbt.myvnc.com
        <Directory /srv/www/>
                AllowOverride All
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

3. Crie um novo arquivo de configuração, denominado `.htaccess`, no diretório root do seu *site* (se *default*, `vim /var/www/html/.htaccess`) e o edite com os seguintes comandos, modificando o endereço para o seu DNS e o seu IP:

```config
RewriteEngine On
RewriteBase /
RewriteCond %{HTTP_HOST} ^192\.168\.50\.23$
RewriteRule ^(.*)$ http://smarbt.myvnc.com/$1 [L,R=301]
```

4. Execute o seguinte comando para ativar o módulo **rewrite**: `a2enmod rewrite`
5. Reinicie o Apache: `systemctl restart apache2` ou `service apache2 restart`.

### 1.3. Nginx

> **Nota:** para alterar o local padrão de execução do servidor (*default* = `/var/www/html`), é necessário alterar o arquivo `/etc/nginx/sites-available/default`, mudando o parâmetro `root` para seu novo diretório.
Em um servidor Nginx é ainda mais fácil redirecionar o endereço de IP do site para um domínio.

1. Edite o arquivo de configuração do Nginx: `vim /etc/nginx/sites-available/<file>`;
2. Adicione um novo bloco de servidor ao arquivo:

```config
server {
    listen 80;
    listen [::]:80;
    server_name site1.xyz www.site1.xyz;
    root /var/www/html;
    index index.html index.php;
    location ~\.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }
}
server {
    listen 80
    server_name 192.168.50.200;
    return 302 http://site1.xyz;
}
```

3. Reinicie o Nginx: `systemctl restart nginx` ou `service nginx restart`.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Como criar meu próprio servidor DNS?

### 2.1. No Ubuntu Server

Abaixo, está apresentado um resumo do seguinte artigo publicado pela Canonical, sobre como construir um DNS no Ubuntu. Para maiores informações, acessar [o artigo][1] na íntegra.

#### Instalações

Todo o processo será feito com o pacote BIND (*Berkley Internet Naming Daemon*), pacote muito utilizado para manutenção de um *name server* no Linux.

1. Instale os pacotes `bind9` e `dnsutils`: `sudo apt install bind9 && sudo apt install dnsutils`
2. Verifique a instalação do BIND9 com: `named -v`

O pacote `dnsutils` é utilizado para testar e resolver problemas relacionados ao DNS.

#### Configuração

Há diversas formas de configurar um servidor com **BIND9**, mas a configuração mais comum é por um **caching nameserver**, **primary server** e um **secondary server**.

- Quando configurar o BIND9 como um **chaching nameserver**, as respostas para as consultas de nomes serão encontradas e guardará essa para futuras consultas.
- Como **primary server**, o BIND9 lê os dados de uma zona de um arquivo em seu host e tem autoridade para essa zona.
- Como **secondary server**, o BIND9 obtém os dados da zona de outro **nameserver** com autoridade para a zona.

#### Overview

Os arquivos de configuração do DNS são armazenados no diretório `/etc/bind`. O arquivo de configuração principal é `/etc/bind/named.conf`, que no layout fornecido pelo pacote inclui apenas esses arquivos:

- `/etc/bind/named.conf.options`: opções globais de DNS
- `/etc/bind/named.conf.local`: para suas zonas
- `/etc/bind/named.conf.default-zones`: zonas padrão como localhost, seu reverso e as dicas de raiz

Os servidores de nomes raiz costumavam ser descritos no arquivo `/etc/bind/db.root`. Isso agora é fornecido pelo arquivo `/usr/share/dns/root.hints` fornecido com o pacote dns-root-data e é referenciado no arquivo de configuração `named.conf.default-zones` acima.

É possível configurar o mesmo servidor para ser um **chaching nameserver**, **primary** e **secondary server**: tudo depende das zonas que ele está servindo. Um servidor pode ser o **Start of Authority (SOA)** para uma zona, enquanto fornece serviço secundário para outra zona. Ao mesmo tempo, fornece serviços de cache para hosts na LAN local.

1. Verifique as informações do host: `hostnamectl status` e copie o hostname
2. Abra o arquivo `/etc/hosts` utilizando o editor de sua preferência
3. Na segunda linha, acrescente uma nova entrada para o domínio e uma nova linha para o IP da rede. Exemplo:

```plaintext
127.0.0.1 localhost
127.0.1.1 srvtest.domain.local srvtest
192.168.70.31 srvtest.domain.local srvtest
```

4. Verificar se as configurações foram salvas normalmente, com os seguintes comandos:

```plaintext
$ hostname
> srvtest
$ dnsdomainname
> domain.local
$ hostname --fqdn
> srvtest.domain.local
```

#### Caching nameserver

1. Adicione as seguintes linhas no arquivo `/etc/bind/named.conf.options`. Substitua o `<hostIP>` com o IP da sua interface de rede e os `<forwardersIP>` pelos IPs de servidores DNS já existentes (e.g. `8.8.8.8` - Google)

```plaintext
recursion yes;
listen-on { <hostIP>; };
allow-transfer { none; };
forwarders {
    <forwardersIP>; // Endereços de IP dos nameservers atuais
};
```

2. Para ativar a configuração, reinicialize o DNS server com: `sudo systemctl restart bind9.service` ou `sudo service bind9 restart`

#### Primary server

##### Forward Zone File

1. Edite o arquivo `/etc/bind/named.conf.local` com o seu FQDN (*Fully Qualified Domain Name*)

```plaintext
zone "example.com" {
    type master;
    file "/etc/bind/db.example.com";
};
```

> **Nota:** se o BIND estiver recebendo atualizações automáticas para o arquivo como com DDNS, utilize o arquivo `/var/lib/bind/db.example.com` ao invés de `/etc/bind/db.example.com`

2. Utilize um arquivo existente de zona para criar um modelo: `sudo cp /etc/bind/db.local /etc/bind/db.example.com`
3. Edite o novo arquivo de zona `/etc/bind/db.example.com` e mude `localhost.` para o FQDN do seu servidor (deixando o ponto no final)
4. Altere `127.0.0.1` para o IP do servidor de nomes
5. Altere `root.localhost` para um endereço de email válido, mas com um `.` em vez do `@` (novamente deixando o `.` no final)
6. Crie um **registro A** para o domínio base, `exemplo.com`
7. Crie um **registro A** para `ns.example.com`
8. Para ativar a configuração, reinicie o DNS server com: `sudo systemctl restart bind9.service` ou `sudo service bind9 restart`

> **Nota:** você deve incrementar o número de série sempre que fizer alterações no arquivo de zona. Muitos admins gostam de utilizar a última data editada como serial de uma zona, como `2023012100`, que é `aaaammddss` (onde `ss` é o número de série)

```plaintext
;
; BIND data file for example.com
;
$TTL    604800
@       IN      SOA     example.com. root.example.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL

@       IN      NS      ns.example.com.
@       IN      A       192.168.1.10
@       IN      AAAA    ::1
ns      IN      A       192.168.1.10
```

##### Reverse Zone File

Agora que a zona está configurada e resolvendo nomes para endereços IP, uma zona reversa precisa ser adicionada para permitir que o DNS resolva um endereço para um nome.

1. Edite `/etc/bind/named.conf.locale` adicione o seguinte:

```plaintext
zone "1.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.192";
};
```

2. Substitua 1.168.192pelos três primeiros octetos de qualquer rede que você esteja usando.
3. Crie um arquivo a partir do `/etc/bind/db.127`. Nomeie o arquivo de zona `/etc/bind/db.192` apropriadamente. Deve corresponder ao primeiro octeto da sua rede. `sudo cp /etc/bind/db.127 /etc/bind/db.192`
4. Altere as mesmas opções do arquivo **forward**.
5. Para ativar a configuração, reinicie o DNS server com: `sudo systemctl restart bind9.service` ou `sudo service bind9 restart`

```plaintext
;
; BIND reverse data file for local 192.168.1.XXX net
;
$TTL    604800
@       IN      SOA     ns.example.com. root.example.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      ns.
10      IN      PTR     ns.example.com.
```

> **Nota:** o número de série na zona reversa também precisa ser incrementado a cada alteração. Para cada registro A que você configurar em `/etc/bind/db.example.com`, ou seja, para um endereço diferente, você precisa criar um registro PTR em `/etc/bind/db.192`.

#### Secondary Server

Uma vez que um Servidor Primário tenha sido configurado, um Servidor Secundário é altamente recomendado para manter a disponibilidade do domínio caso o primário fique indisponível.

1. Adicione a opção `allow-transfer` ao exemplo de definições de zona direta e reversa em `/etc/bind/named.conf.local`, substituindo `192.168.1.11` pelo endereço do **nameserver** secundário.

```plaintext
zone "example.com" {
    type master;
    file "/etc/bind/db.example.com";
    allow-transfer { 192.168.1.11; };
};
    
zone "1.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.192";
    allow-transfer { 192.168.1.11; };
};
```

2. Reinicie o serviço BIND9 do servidor primário.
3. No servidor secundário, instale o BIND9 da mesma forma como feito no primário.
4. Edite o `/etc/bind/named.conf.local` e adicione as declarações para as zonas direta e reversa, substituindo `192.168.1.10` pelo endereço IP do seu servidor de nomes primário
5. Reinicie o BIND9 no servidor secundário.

```plaintext
zone "example.com" {
    type secondary;
    file "db.example.com";
    masters { 192.168.1.10; };
};        
          
zone "1.168.192.in-addr.arpa" {
    type secondary;
    file "db.192";
    masters { 192.168.1.10; };
};
```

> **Nota:** uma zona só é transferida se o número de série no Primário for maior que o do Secundário. Se você deseja que seu DNS primário notifique outros servidores DNS secundários sobre alterações de zona, você pode adicionar `also-notify { ipaddress; };` como `/etc/bind/named.conf.local` mostrado no exemplo abaixo:

```plaintext
zone "example.com" {
    type master;
    file "/etc/bind/db.example.com";
    allow-transfer { 192.168.1.11; };
    also-notify { 192.168.1.11; }; 
};

zone "1.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.192";
    allow-transfer { 192.168.1.11; };
    also-notify { 192.168.1.11; }; 
};
```

> **Nota:** o diretório padrão para arquivos de zona não autoritativos é `/var/cache/bind/`. Esse diretório também é configurado no AppArmor para permitir que o daemon nomeado grave nele.

### 2.2. Em um container
<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://ubuntu.com/server/docs/service-domain-name-service-dns

<!-- IMAGES -->