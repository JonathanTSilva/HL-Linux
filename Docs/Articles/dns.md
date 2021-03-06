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

<!-- MARKDOWN LINKS -->
<!-- SITES -->

<!-- IMAGES -->