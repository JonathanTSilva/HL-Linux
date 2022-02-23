<!-- LOGO DIREITO -->
<a href="#como-preparar-um-ambiente-lamp"><img width="200px" src="../../Images/lamp.png" align="right" /></a>

# Como preparar um ambiente LAMP

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

🐧 Este documento apresenta um guia para a criação de um sistema LAMP. Foi desenvolvido com a série de vídeos auxílio dos vídeos do canal Projeto Root.

<!-- SUMÁRIO -->
- [Como preparar um ambiente LAMP](#como-preparar-um-ambiente-lamp)
  - [1. Introdução ao LAMP](#1-introdução-ao-lamp)
    - [1.1. O que é?](#11-o-que-é)
    - [1.2. Como funciona?](#12-como-funciona)
  - [2. Ubuntu](#2-ubuntu)
    - [2.1. Instalação](#21-instalação)
      - [2.1.1. Apache e PHP](#211-apache-e-php)
      - [2.1.2. Banco de Dados](#212-banco-de-dados)
        - [2.1.2.1. MySQL-Server (MariaDB)](#2121-mysql-server-mariadb)
        - [2.1.2.2. PostgreSQL](#2122-postgresql)
      - [2.1.3. Verificação dos Serviços](#213-verificação-dos-serviços)
    - [2.2. Configuração](#22-configuração)
      - [2.2.1. MySQL - phpMyAdmin](#221-mysql---phpmyadmin)
      - [2.2.2. PostgreSQL - pgAdmin](#222-postgresql---pgadmin)
  - [3. Debian](#3-debian)
    - [3.1. Instalação](#31-instalação)
    - [3.2. Configuração](#32-configuração)
      - [3.2.1. MySQL - phpMyAdmin](#321-mysql---phpmyadmin)
      - [3.2.2. PostgreSQL - pgAdmin](#322-postgresql---pgadmin)
  - [4. CentOS](#4-centos)
    - [4.1. Instalação](#41-instalação)
    - [4.2. Configuração](#42-configuração)
      - [4.2.1. MySQL - phpMyAdmin](#421-mysql---phpmyadmin)
      - [4.2.2. PostgreSQL - pgAdmin](#422-postgresql---pgadmin)

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Introdução ao LAMP

### 1.1. O que é?

LAMP é um acrônimo que denota um dos conjuntos de soluções mais comuns para muitas das aplicações mais populares na web, Linux, Apache, MySQL e PHP (Perl). No entanto, LAMP agora se refere a um modelo de conjunto de software genérico e seus componentes são amplamente intercambiáveis.

### 1.2. Como funciona?

Sempre que uma requisição de página chega em um servidor, ela passa por uma aplicação chamada servidor web, em nosso caso o Apache. O Apache procura pelo arquivo sendo solicitado na URL da requisição e passa a informação para o intérprete do PHP.

Ele executa a lógica contida no arquivo, retrai as informações do banco de dados MySQL e gera a página da internet. Então o Apache envia a página gerada para o cliente. Esse processo é executado com algumas variações sempre que uma página da internet é requisitada de um servidor LAMP.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Ubuntu

### 2.1. Instalação

De início, acesse a sua máquina via SSH (de preferência), entre como root do sistema (`sudo su -`) e a prepare para o sistema, efetuando os seguintes tópicos:

- Preparação do sistema:

```zsh
apt update && apt upgrade && apt dist-upgrade && apt autoremove && apt autoclean && apt clean
```

- Instalação do Net-Tools:

```zsh
sudo apt install net-tools
```

#### 2.1.1. Apache e PHP

Um agrupamento dos principais pacotes utilizados por aplicações WEB foi realizado e separados em duas instalações diferentes do LAMP: o WEB server **Light** e **Full**. Lembre-se que os módulos necessários variam para cada aplicação (Wordpress, CMS, página pessoal, etc.). Sempre fique atento na documentação do sistema que utilizará e implemente (ou retire) dos módulos abaixo.

- WEB Server (Apache) Light:

```zsh
apt instal -y apache2 php7.4 libapache2-mod-php7.4
```

O seguinte comando diz para o sistema que, ao reiniciar, deve ser carregado o Apache:

```zsh
systemctl enable apache2.service
```

```zsh
systemctl start apache2.service
```

- WEB Server (Apache) Full:

```zsh
apt install -y ca-certificates apache2 bzip2 curl php7.4-json php7.4-bz2 libapache2-mod-php7.4 libmariadbd-dev php-soap php-cas php7.4 php-apcu php7.4-cli php7.4-common php7.4-curl php7.4-gd php7.4-imap php7.4-ldap php7.4-mysql php7.4-snmp php7.4-xmlrpc php7.4-xml php7.4-mbstring php7.4-bcmath php7.4-zip php7.4-intl php7.4-bz2 php-pear php-imagick php-memcache php7.4-pspell php7.4-tidy php7.4-xsl
```

```zsh
systemctl enable apache2.service
```

```zsh
systemctl start apache2.service
```

Após realizar a instalação e execução do serviço Apache, é possível acessar o IP do server pelo browser do navegador e verificar se é mostrado a página *default* da aplicação. Caso você esteja utilizando uma máquina virtual em uma **Nat Network**, não esqueça de adicionar um tunelamento para a host.

#### 2.1.2. Banco de Dados

Vamos partir para a instalação do banco de dados para o servidor. Atualmente, têm-se duas opções mais populares para este gerenciamento de banco de dados: MariaDB e Postgres. Abaixo, veremos como instalar cada uma delas.

> **Nota:** não recomenda-se instalar mais de um banco de dados no mesmo servidor, a não ser que tenha um motivo muito explícito para tal realização.

##### 2.1.2.1. MySQL-Server (MariaDB)

O MariaDB Server é um dos bancos de dados relacionais de código aberto mais populares. É feito pelos desenvolvedores originais do MySQL e garantido para permanecer em código aberto. Faz parte da maioria das ofertas de nuvem e é o padrão na maioria das distribuições Linux.

Ele é construído sobre os valores de desempenho, estabilidade e abertura, e a MariaDB Foundation garante que as contribuições sejam aceitas por mérito técnico. Novas funcionalidades recentes incluem clustering avançado com Galera Cluster 4, recursos de compatibilidade com Oracle Database e Temporal Data Tables, permitindo consultar os dados como estavam em qualquer ponto do passado.

```zsh
apt install -y mysql-server
```

A porta padrão para o MySQL/MariaDB é a **3306**.

##### 2.1.2.2. PostgreSQL

```zsh
apt install -y postgresql postgresql-contrib
```

A porta padrão para o Postgres é a **5432**.

#### 2.1.3. Verificação dos Serviços

```zsh
netstat -pultan
```

### 2.2. Configuração

Tendo instalado todos pacotes necessários para um servidor WEB Apache básico, são necessárias algumas configurações para aprimoramento da segurança e facilidade na utilização. Utilizaremos os seguintes softwares para cada gerenciador de banco de dados: **phpMyAdmin** e **pgAdmin**. 

Abaixo estão as informações necessárias para cada um.

> **Nota:** esses softwares são recomendados quando o administrador do server não domina muito o shell, pois são apenas complementares. Todo o processo pode ser realizado via linha de comando. Inclusive, quanto mais software existir dentro de um servidor em produção, maior o nível de vulnerabilidade dentro dele.
> Para resolver isso, utiliza-se servidores específicos para cada tipo de processo. Exemplo: um servidor para o site, outro para o banco de dados e um terceiro para as aplicações complementares, como o phpMyAdmin e pgAdmin (para ficar fora da linha de produção). Mas vai da preferência de cada adm para sua infranet.

#### 2.2.1. MySQL - phpMyAdmin

A primeira questão de segurança a ser abordada em um servidor WEB é a definição de uma senha para o usuário root do banco de dados instalados, pois ao completar tal instalação, este usuário, por padrão, não apresenta senha.

Para adicionar uma senha à este usuário root, siga os passos:

1. Conectar no mysql com o usuário root: `mysql -u root`;
2. Solicitar a troca de senha para esse usuário:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '〈senhaSegura〉';
```

3. Sair (`exit`) e entrar novamente no MySQL, para que apareça a notificação de que é necessário uma senha;

> **Nota:** caso ele entre e não solicite a senha, é necessário utilizar o comando acima com um parâmetro adicional:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED with mysql_native_password BY '〈senhaSegura〉';
```

4. Para entrar no MySQL (agora com a senha no root), utilizar o comando de acesso com o parâmetro adicional `-p`:

```sql
mysql -u root -p
```

Configurado a senha, o sistema está apto para utilizar o **phpMyAdmin**. Este software possui código-livre e permite criar e remover bases de dados; criar, remover e alterar tabelas; inserir, remover e editar campos; executar códigos SQL e manipular campos chaves através de uma interface web no seu navegador.

Tendo realizado a configuração inicial para o Banco de Dados, agora podemos instalar o phpMyAdmin com o seguinte código:


```zsh
apt -y install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
```

O pacote te redirecionará para uma parte de configuração, nas quais devem ser selecionadas as seguintes opções:

<table>
    <tr>
        <td>
            <small>
                Please choose the web server that should be automatically configured to run phpMyAdmin. <br>
                Web server to reconfigure automatically: <br>
                ✅ apache2 <br>
                ⬜ lighttpd
            </small>
        </td>
    </tr>
</table>

<table>
    <tr>
        <td>
            <small>
                The phpmyadmin package must have a database installed and configured before it can be used. This can be optionally handled with dbconfig-common. <br>
                WIf you are an advanced database administrator and know that you want to perform this configuration manually, or if your database has already been installed and configured, you should refuse this option. Details on what needs to be done should most likely be provided in /usr/share/doc/phpmyadmin. <br>
                Otherwise, you should probably choose this option. <br>
                Configure database for phpmyadmin with dbconfig-common? <br>
                ✅ Yes <br>
                ⬜ No
            </small>
        </td>
    </tr>
</table>

<table>
    <tr>
        <td>
            <small>
                Please provide a password for phpmyadmin to register with the database server. If left blank, a random password will be generated. <br>
                MySQL application password for phpmyadmin:<br>
                〈FILL WITH PASSWORD〉<br>
                ✅ Ok <br>
                ⬜ Cancel
            </small>
        </td>
    </tr>
</table>

A partir daqui, o phpMyAdmin cria o banco de dados `config-db` e começa a popula-lo para que o ele mesmo utilize este DB.

Feito isso, ao acessar no browser o IP do servidor (ou DNS), já estará disponível a interface do software.

> **Nota:** acesso feito com: `http://IP/phpMyAdmin` ou apenas o `http://IP`, visto que este software também utiliza a porta 80 (padrão) do server. Caso queira, altere a porta para alguma outra.

#### 2.2.2. PostgreSQL - pgAdmin

Assim como no MySQL, é preciso colocar senha no usuário root para o Postgres. Para tal, reproduzir os passos:

1. Logar com o usuário postgres no banco de dados psql: `sudo -u postgres psql`;
2. Estando dentro do DB, passar o parâmetro para alterar a senha: `\password`;
3. Digitar a senha do usuário, e confirmá-la;
4. Sair do postgres: `\q`;
5. Alterada a senha, é necessário modificar o método de autenticação. Para isso, faz se necessária a edição de um arquivo que carregue essas informações:

```zsh
vim /etc/postgresql/〈versão〉/main/pg_hba.conf
```

- Modificar as seguintes informações:

```conf
# Database administrative login by Unix domain socket
local       all             postgres                        md5

# TYPE      DATABASE        USER          ADDRESS           METHOD

# "local" is for Unix domain socket connections only
local       all             all                             md5
```

- Assim, restartar o serviço do postgres: `service postgresql restart`;
- Entrar novamente no Postrges e colocar a senha do usuário.

Como verificado no tópico antecessor à esse, foi mostrada a configuração para software que envolve o MySQL. Para o sistema de gerenciamento de banco de dados PostgreSQL, há um software chamado pgAdmin, que assim como o phpMyAdmin, é um software de código-livre e permite criar e remover bases de dados; criar, remover e alterar tabelas; inserir, remover e editar campos; executar códigos do Postgres e manipular campos chaves através de uma interface web no seu navegador.

Há duas versões disponíveis para instalação: a desktop e a WEB. Entretanto, neste documento é apenas mostrado o procedimento de instalação para a versão WEB. Caso queira instalar a outra opção, seguir a [documentação oficial](2) apresentada no site.

São necessárias algumas modificações específicas para cada distribuição para o correto funcionamento do pgAdmin. A primeira delas é modificação dos repositórios, uma vez que, por padrão, não são trazidos esses repositórios na instalação do sistema operacional. Para tal, seguir os passos:

- Instalar a chave pública para esse repositório (caso não tenha sido instalada anteriormente):

```zsh
# Com CURL - versão mais nova
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add

# Ou com WGET - versão mais antiga
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
```

- Adicionar o repositório:

```zsh
# Caso feito o passo anterior com o CURL
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Se com o WGET
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
```

- Feito isso, instale o pgAdmin com:

```zsh
sudo apt install pgadmin4-web
```

Na instalação do pacote, você será redirecionado para uma parte de configuração, nas quais devem ser selecionadas as seguintes opções:

<table>
    <tr>
        <td>
            <small>
                The pgAdmin4 web interface needs an initial user configured. Please enter the email address you want to use as the account name. <br>
                Initial pgAdmin4 user email: <br>
                〈FILL WITH EMAIL〉<br>
                ✅ Ok <br>
            </small>
        </td>
    </tr>
</table>

<table>
    <tr>
        <td>
            <small>
                The pgAdmin4 web interface needs an initial user configured. Please enter the email address you want to use as the account name. <br>
                Initial pgAdmin4 password: <br>
                〈FILL WITH EMAIL〉<br>
                ✅ Ok <br>
            </small>
        </td>
    </tr>
</table>

> **Nota:** recomenda-se por boas práticas, a utilização de um email existente e a mesma senha, apesar de não precisar.

> **Nota:** acesso feito com: `http://IP/pgAdmin4`.

Mesmo após instalação, e diferentemente do phpMyAdmin, nesta aplicação é necessário informar qual o host que vai ser conectado (tanto o localhost, quanto para um host remoto). Assim, ao acessar o website, siga as instruções:

1. Entre com o email e senhas cadastrados;
2. Clique em "**Add New Server**";
3. Preencha com o nome, comentário e clique em "**Connections**";
4. Preencha com o IP do servidor Postgres em "**Host name/address**". Se for local, utilizar `localhost` ou `127.0.0.1`;
5. Preencha com a porta do Postgres (default = 5432);
6. O Banco de dados de manutenção (default = postgres);
7. Para o campo "**username**", coloque o usuário `postgres` (configurado no começo deste tópico);
8. Para o campo "**password**", coloque a mesma cadastrada para o usuário;
9. Selecione "**Save password?**" para salvar a senha, caso prefira;
10. Clique em "**Save**" para salvar a configuração.

Ao realizar tal configuração, é possível manusear os bancos de dados disponíveis no servidor cadastrado.

Uma outra opção (mais atualizada), para essa configuração, é configurar o webserver pelo comando:

```zsh
sudo /usr/pgadmin4/bin/setup-web.sh
```

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Debian

### 3.1. Instalação

### 3.2. Configuração

#### 3.2.1. MySQL - phpMyAdmin

#### 3.2.2. PostgreSQL - pgAdmin

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 4. CentOS

- Preparação do sistema:

```zsh
yum update && yum clean all
```

### 4.1. Instalação

### 4.2. Configuração

#### 4.2.1. MySQL - phpMyAdmin

#### 4.2.2. PostgreSQL - pgAdmin

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://www.youtube.com/watch?v=Lv_bDnjdJ3Q
[2]: https://www.pgadmin.org/

<!-- IMAGES -->
