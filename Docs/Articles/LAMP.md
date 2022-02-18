<a href="#como-preparar-um-ambiente-lamp"><img width="200px" src="../../Images/lamp.png" align="right" /></a>

# Como preparar um ambiente LAMP

🐧 Este documento apresenta um guia para a criação de um sistema LAMP.

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
      - [2.2.1. Banco de Dados](#221-banco-de-dados)
        - [2.2.1.1. MySQL-Server (MariaDB)](#2211-mysql-server-mariadb)
        - [2.2.1.2. PostgreSQL](#2212-postgresql)
      - [2.2.2. phpMyAdmin](#222-phpmyadmin)
  - [3. Debian](#3-debian)
    - [3.1. Instalação](#31-instalação)
    - [3.2. Configuração](#32-configuração)
  - [4. CentOS](#4-centos)
    - [4.1. Instalação](#41-instalação)
    - [4.2. Configuração](#42-configuração)

## 1. Introdução ao LAMP

### 1.1. O que é?

LAMP é um acrônimo que denota um dos conjuntos de soluções mais comuns para muitas das aplicações mais populares na web, Linux, Apache, MySQL e PHP (Perl). No entanto, LAMP agora se refere a um modelo de conjunto de software genérico e seus componentes são amplamente intercambiáveis.

### 1.2. Como funciona?

Sempre que uma requisição de página chega em um servidor, ela passa por uma aplicação chamada servidor web, em nosso caso o Apache. O Apache procura pelo arquivo sendo solicitado na URL da requisição e passa a informação para o intérprete do PHP.

Ele executa a lógica contida no arquivo, retrai as informações do banco de dados MySQL e gera a página da internet. Então o Apache envia a página gerada para o cliente. Esse processo é executado com algumas variações sempre que uma página da internet é requisitada de um servidor LAMP.

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

Tendo instalado todos pacotes necessários para um servidor WEB Apache básico, são necessárias algumas configurações para aprimoramento da segurança e facilitar a utilização.

#### 2.2.1. Banco de Dados

A primeira questão de segurança a ser abordada em um servidor WEB é a definição de uma senha para o usuário root do banco de dados instalados, pois ao completar tal instalação, este usuário, por padrão, não apresenta senha.

Para adicionar uma senha à este usuário root, siga os passos referentes ao seu gerenciador de dados:

##### 2.2.1.1. MySQL-Server (MariaDB)

1. Conectar no mysql com o usuário root: `mysql -u root`
2. Solicitar a troca de senha para esse usuário:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '〈senhaSegura〉';
```

3. Sair (`exit`) e entrar novamente no MySQL, para que apareça a notificação de que é necessário uma senha.

> **Nota:** caso ele entre e não solicite a senha, é necessário utilizar o comando acima com um parâmetro adicional:

```sql
ALTER USER 'root'@'localhost' IDENTIFIED with mysql_native_password BY '〈senhaSegura〉';
```

4. Para entrar no MySQL (agora com a senha no root), utilizar o comando de acesso com o parâmetro adicional `-p`:

```sql
mysql -u root -p
```

##### 2.2.1.2. PostgreSQL

#### 2.2.2. phpMyAdmin

O software phpMyAdmin possui código-livre e permite criar e remover bases de dados; criar, remover e alterar tabelas; inserir, remover e editar campos; executar códigos SQL e manipular campos chaves através de uma interface web no seu navegador.

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
                MySQL application password for phpmyadmin: <br>
                <input type="password" id="pass" name="pass" size="60"> <br>
                ✅ Ok <br>
                ⬜ Cancel
            </small>
        </td>
    </tr>
</table>

A partir daqui, o phpMyAdmin cria o banco de dados `config-db` e começa a popula-lo para que o ele mesmo utilize este DB.

Feito isso, ao acessar no browser o IP do servidor (ou DNS), já estará disponível a interface do software.

> **Nota:** acesso feito com: `http://IP/phpMyAdmin` ou apenas o `http://IP`, visto que este software também utiliza a porta 80 (padrão) do server. Caso queira, altere a porta para alguma outra.

## 3. Debian

### 3.1. Instalação

### 3.2. Configuração

## 4. CentOS

- Preparação do sistema:

```zsh
yum update && yum clean all
```

### 4.1. Instalação

### 4.2. Configuração
