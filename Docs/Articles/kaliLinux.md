<!-- LOGO DIREITO -->
<a href="#"><img width="300px" src="http://4.bp.blogspot.com/-A9YK7Y9TX0g/VqPVd5zs6CI/AAAAAAAAQpo/XSHoKxXb8vA/s1600/kali_linux.png" align="right" /></a>

# Manual de sobrevivência do Kali Linux

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

🐉 Tudo o que você precisa saber para não se perder no Kali Linux.

<!-- SUMÁRIO -->
- [Manual de sobrevivência do Kali Linux](#manual-de-sobrevivência-do-kali-linux)
  - [1. Introdução](#1-introdução)
  - [2. Instalação](#2-instalação)
  - [3. Utilização](#3-utilização)
    - [3.1. Configurar repositórios](#31-configurar-repositórios)
    - [3.2. Metasploit](#32-metasploit)
  - [4. Ferramentas](#4-ferramentas)
    - [4.1. Information Gathering](#41-information-gathering)
      - [4.1.1. 3.1.1.](#411-311)
    - [4.2. Vulnerability Analysis](#42-vulnerability-analysis)
      - [4.2.1. nikto](#421-nikto)
      - [4.2.2. nmap](#422-nmap)
    - [4.3. Web Application Analysis](#43-web-application-analysis)
      - [4.3.1. burpsuit](#431-burpsuit)
      - [4.3.2. sqlmap](#432-sqlmap)
    - [4.4. Database Assessment](#44-database-assessment)
      - [4.4.1.](#441)
    - [4.5. Password Attacks](#45-password-attacks)
      - [4.5.1.](#451)
    - [4.6. Wireless Attacks](#46-wireless-attacks)
      - [4.6.1.](#461)
    - [4.7. Reverse Engineering](#47-reverse-engineering)
      - [4.7.1.](#471)
    - [4.8. Exploitation Tools](#48-exploitation-tools)
      - [4.8.1.](#481)
    - [4.9. Sniffing & Spoofing](#49-sniffing--spoofing)
      - [4.9.1. arpspoof](#491-arpspoof)
      - [4.9.2. dnsspoof](#492-dnsspoof)
      - [4.9.3. ettercap](#493-ettercap)
      - [4.9.4. wireshark](#494-wireshark)
    - [4.10. Post Exploitation](#410-post-exploitation)
      - [4.10.1.](#4101)
    - [4.11. Forensics](#411-forensics)
      - [4.11.1.](#4111)
    - [4.12. Reporting Tools](#412-reporting-tools)
      - [4.12.1.](#4121)
    - [4.13. Social Engineering Tools](#413-social-engineering-tools)
      - [4.13.1.](#4131)
    - [4.14. System Services](#414-system-services)
      - [4.14.1.](#4141)

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Introdução

Kali Linux é uma distribuição GNU/Linux baseada no Debian (mais especificamente no Debian "Testing"), considerado o sucessor do Back Track. O projeto apresenta várias melhorias, além de mais aplicativos. É voltado principalmente para auditoria e segurança de computadores em geral. É desenvolvido e mantido pela Offensive Security Ltd. Desde 21 de janeiro de 2016, é uma distribuição "rolling-release", que remete basicamente à entrega contínua de um software.

O Kali Linux dispõe de numerosos softwares pré-instalados, incluindo o **Nmap** (*port scanner*), **WireShark** (um sniffer), **John the Ripper** (*crackeador* de *password*) e **Aircrack-ng** (software para testes de segurança em rede de computadores/redes sem fios, entre muitas outras aplicações voltadas para diversas tarefas da área de segurança da informação, como: teste de penetração, computação forense, pesquisa de segurança, etc.

- Mais de 600 ferramentas de *Penetration Test*;
- Livre (e sempre será, de acordo com a *Offensive Security*);
- Código aberto;
- Compatível com FHS (padrão de hierarquia dos sistemas de arquivos);
- Suporte à redes Wireless;
- Kernel personalizado, recomendado para injeção;
- Desenvolvido em ambiente seguro;
- Repositórios e pacotes assinados com GPG;
- Suporte multi idiomas;
- Completamente customizável.

> **Nota:** como alternativa do Kali Linux, há o sistema Parrot. Verifique mais detalhes na [página oficial do site][3].

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Instalação

Vale enfatizar a priori que o Kali Linux possui uma versão Live (até uma versão Live Forensics) para instalação em dispositivos remotos. Segue as formas possíveis de instalação do Kali Linux:

- Live USB
- DualBoot
- Virtualizado
- Raspberry Pi
- ...

Entretanto, para uma instalação normal do sistema operacional em disco, é necessários seguir os procedimentos padrões para isso:

- Criar um USB Bootável com o Kali Linux (Ventoy, Rufus, Win32 - ou com o comando no Linux: `dd if=<nomeISO> of=/dev/<nome> bs=512k`);
- Iniciar sistema pelo bootável;
- Instalar o Kali;
- Selecione todas as configurações iniciais;
- Por boas práticas, particione o seu disco manualmente seguindo [recomendações do RedHat][1];
- Finalize a instalação.

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Utilização

### 3.1. Configurar repositórios

Uma source list com os repositórios oficial do Kali Linux pode ser encontrada no seguinte caminho do seu sistema:

```
/etc/apt/sources.list
```

Ao editar este arquivo, certifique que os repositórios ali colocados estão atualizados de acordo com a página oficial do site. Pode-se verificar qual o ativo com o seguinte comando:

```
grep -v '#' /etc/apt/sources.list | sort -u
```

O tópico de repositórios é sempre grande e aparece com frequência. É um item que muitas vezes as pessoas erram e confundem. Por favor, reserve um tempo para ler as informações [deste artigo][2] na página oficial do Kali e quaisquer referências às quais estejam vinculadas antes de agir.

Uma vez realizado estes passos, dar o comando `apt update` para baixar todos os dados destes repositórios.

### 3.2. Metasploit

Além do conjunto de ferramentas já instaladas junto com o Kali Linux, com relação à *Forensics*, análise de vulnerabilidades etc., há um framework chamado Metasploit, que é um outro conjunto de ferramentas. Este framework é um conjunto das melhores plataformas de aprendizagem e investigação que um profissional de segurança ou hackers éticos podem utilizar. Possui centenas de exploradores, payloads e diversas outras ferramentas.

Primeiramente, antes de inicializá-lo, há algumas configurações básicas a serem feitas:

- Inicializar o banco de dados do Metasploit: **postgresql**;
  - `/etc/init.d/postgresql status` ou `service postgresql status`;
  - `/etc/init.d/postgresql start` ou `service postgresql start`.
- Uma vez com o banco de dados iniciado, é necessário inicializar o database do metasploit:
  - `msfdb init`;
  - Para saber quais outros comandos é aceito pelo Metasploit, digite `msf`e aperte tab para ver as opções;
- Abrir o console do Metasploit:
  - `msfconsole`;
  - O console já inicia mostrando para o usuário o quanto de exploits, módulos auxiliares, payloads e decodificadores é possível encontrar na base de dados deles.
- Para verificar se a base de dados está funcionando corretamente:
  - `db_status`;

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 4. Ferramentas

Para analisar as ferramentas a seguir, foi criado um servidor *metasploitable*, utilizando um outro ambiente Kali, para que este seja alvo dos ataques. Apenas para fins didáticos, ele foi alocado no IP: **192.168.0.10/25**, mas possui um DNS: **metasploitable.testserver.com**. Sendo assim, para cada representação de um servidor web será utilizado este endereço.

### 4.1. Information Gathering

Esses softwares ou aplicativos têm a função de coletar e formatar os dados em um formato que possa ser usado posteriormente. Isso é semelhante aos cookies usados ​​por diferentes sites ou ao seu histórico de navegação usado pelo Google para personalizar cada anúncio e fornecer os melhores serviços para você. O sistema operacional Kali fornece essas ferramentas para a comunidade de desenvolvedores e testes de penetração para ajudar na coleta e formulação de dados capturados. 
Algumas das ferramentas são:

> **Nota:** o Nmap é o mais famoso dessas ferramentas.

#### 4.1.1. 3.1.1.

### 4.2. Vulnerability Analysis

Vulnerabilidade é um estado ou condição de ser exposto à possibilidade de ser atacado ou prejudicado de uma ou outra forma. Essas ferramentas são usadas para verificar um sistema ou máquina quanto a qualquer tipo de fluxo e vulnerabilidade disponível neles, o que pode levar a qualquer violação de segurança e perda de dados. Essas ferramentas também ajudam a corrigir essas vulnerabilidades, pois a identificação torna o usuário ciente do fluxo.

Por exemplo: Se o Windows lançar seu novo sistema operacional, antes de fornecê-lo ao usuário final, ele o enviará para análise e correção de vulnerabilidades.
Algumas das ferramentas:

> **Nota:** todas essas ferramentas são muito comuns na comunidade.

#### 4.2.1. nikto

**Descrição**
Analisador de vulnerabilidades web. Examina um servidor web para encontrar problemas potenciais e vulnerabilidades de segurança, incluindo:

- Configurações incorretas de softwares e servidores;
- Programas e arquivos padrões;
- Arquivos e programas inseguros;
- Servidores e programas desatualizados.

Nikto é construído com LibWhisker (por RFP) e pode rodar em qualquer plataforma na qual apresenta um ambiente Perl. Suporta SSL, proxies, autenticações host, evasão IDS e mais. Pode ser atualizado automaticamente pela linha de comando, e suporta o envio opcional de dados de versão atualizados de volta aos mantenedores. Para mais informações, acesse os comandos de ajuda `man nikto`e `nikto --help`.

**Exemplos**

- Comandos básicos

```bash
$ nikto -h http://metasploitable.testserver.com
> OpenSSL/0.9.8g appears to be outdated (current is at least 1.0.1j). OpenSSL 1.0.0o and 0.9.8zc are also current. # Exemplo 1 de vulnerabilidade
> OSVDB-3268> /doc/: Directory indexing found. # Este número OSVDB pode ser pesquisado na base de dados "The Open Source Vulnerability Database"
```

> **Nota:** o nikto é bastante barulhento, ou seja, deixa muitos rastros e logs no host explorado, apresentando fácil detecção para essa exploração. Para isso, é comumente utilizado ao lado de outras aplicações, como o **proxychains4**, para mascarar com um proxy.

#### 4.2.2. nmap

**Descrição**

Apesar de estar categorizado como um programa na categoria de análise de vulnerabilidade, ele não apenas faz isso. É uma das ferramentas mais poderosas no mundo **hacking**. Em suma, é uma ferramenta de exploração de rede e scanner de segurança/porta. Para mais informações, acesse os comandos de ajuda `man nmap`e `nmap --help`.

**Exemplos**

- Comandos básicos

```bash
nmap -v metasploitable.testserver.com # -v = verbose
nmap -A -T4 metasploitable.testserver.com # Um scan nmap típico para -A = habilitar a detecção de OS e versão, scanner de script e traceroute; e, -T4 = para uma rápida execução
nmap -sV -O metasploitable.testserver.com # -sV = detalha a porta, estado, serviço e versão do serviço; -O = mostrar o sistema operacional.
```

### 4.3. Web Application Analysis

Aplicação Web é uma página web de resposta dinâmica que auxilia em uma melhor e interativa relação cliente-servidor. Essas ferramentas identificam e acessam sites por meio do navegador para verificar qualquer bug ou brecha presente, o que pode levar à perda de qualquer informação ou dado.

Por exemplo, se houver um site com um gateway de pagamento, esses analisadores da web verificam se há autenticação e autorização suficientes no site. Esses aplicativos da web usam:

- Injeções de SQL
- Negação de serviço
- Manipulação de URL

Algumas das ferramentas são: 

> **Nota:** Burpsuite, vega e web scarab são algumas das ferramentas mais famosas.

#### 4.3.1. burpsuit

**Descrição**

Ferramenta que serve como um proxy. Para mais informações, acesse os comandos de ajuda `man nmap`e `nmap --help`.

**Exemplos**

- Comandos básicos

```bash

```

#### 4.3.2. sqlmap

**Descrição**

Ataques de injeção SQL. Para mais informações, acesse os comandos de ajuda `man sqlmap`e `sqlmap --help`.

**Exemplos**

- Comandos básicos

```bash
$ sqlmap -u http://testphp.vulnweb.com/listproducts.php?cat=1 --dbs
```

> **Nota:** para testes, há um site desenvolvido próprio para ser vulnerável, chamado: testphp.vulnweb.com.

### 4.4. Database Assessment

Esses aplicativos são feitos para acessar o banco de dados e analisá-lo para diferentes ataques e problemas de segurança. Essa avaliação mostra algumas oportunidades de melhorias e mudanças. Eles desenvolvem um relatório da análise feita no sistema de banco de dados. Eles executam:

- Verificação de configuração
- Examinando a conta de usuário
- Concessões de privilégios e funções
- Controle de autorização
- Gerenciamento de chaves
- Criptografia de dados

Algumas das ferramentas são:

> **Nota:** Sqlmap é a ferramenta de avaliação de banco de dados mais famosa.

#### 4.4.1. 

### 4.5. Password Attacks

São basicamente uma coleção de ferramentas que podem manipular a lista de palavras ou a lista de senhas a serem verificadas em quaisquer credenciais de login por meio de diferentes serviços e protocolos. Algumas ferramentas são coletores de listas de palavras e algumas delas são o invasor. Algumas das ferramentas são:

> **Nota:** John the Ripper e Medusa são as ferramentas mais famosas.

#### 4.5.1. 

### 4.6. Wireless Attacks

Essas ferramentas são crackers de segurança sem fio, como quebrar wifi – roteadores, trabalhar e manipular pontos de acesso. Os ataques sem fio não se limitam à quebra de senhas, eles também são usados ​​na coleta de informações e no conhecimento do comportamento das vítimas na Internet.

Por exemplo, a vítima está conectada a um ponto de acesso comprometido ou a um ponto de acesso falso e pode ser usado como um ataque *Man-in-The-Middle*. Algumas das ferramentas são:

> **Nota:** Aircrack-ng e Ghost Phisher são as ferramentas mais famosas.

#### 4.6.1. 

### 4.7. Reverse Engineering

Engenharia Reversa é quebrar as camadas dos aplicativos ou software. Isso é usado na criação de rachaduras e patches para diferentes softwares e serviços. Essas ferramentas alcançam o código-fonte da aplicação, entendem seu funcionamento e manipulam de acordo com as necessidades.

Por exemplo, ferramentas de engenharia reversa também são usadas por empresas de ponta para conhecer a lógica e a ideia por trás do software. Algumas das ferramentas são:

> **Nota:** as ferramentas mais famosas são ollydbg e apltools.

#### 4.7.1. 

### 4.8. Exploitation Tools

Essas ferramentas são usadas para explorar diferentes sistemas como computadores pessoais e telefones celulares. Essas ferramentas podem gerar cargas úteis para o sistema vulnerável e, por meio dessas cargas, as informações dos dispositivos podem ser exploradas.

Por exemplo, o sistema da Vítima é comprometido usando cargas úteis pela Internet ou instalando-o se estiver fisicamente acessível. Algumas das ferramentas são:

> **Nota:** a ferramenta mais famosa é o Metasploit (há cursos para aprender o Metasploit)

#### 4.8.1. 

### 4.9. Sniffing & Spoofing

Acessar secretamente qualquer dado não autorizado pela rede é sniffing. Ocultar identidade real e criar identidade falsa e usá-la para qualquer trabalho ilegal ou não autorizado é spoofing. A falsificação de IP e a falsificação de MAC são dois ataques famosos e mais usados. Algumas das ferramentas são:

> **Nota:** a ferramenta mais utilizada é o Wireshark.

#### 4.9.1. arpspoof

**Descrição**

Ataque *Man-in-The-Middle*, aplica um envenenamento na rede, fazendo com que o MACAddress da máquina seja o mesmo do Gateway, visualizando toda a informação que passa por mim. Para mais informações, acesse os comandos de ajuda `man arpspoof`e `arpspoof --help`.

**Exemplos**

- Utilização

```bash
$ arpspoof [-i interface] [-c own|host|both] [-t target] [-r] host
```

#### 4.9.2. dnsspoof

**Descrição**

Ataque *Man in the Middle*, aplica um envenenamento no DNS, fazendo com que o DNS principal seja sua máquina, visualizando toda a informação que passa. Por exemplo, ao aplicar o comando `nslookup facebook.com.br`, será retornado um endereço de IP, com o `dnsspoof`, será alterado este para o da sua máquina. Para mais informações, acesse os comandos de ajuda `man dnsspoof`e `dnsspoof --help`.

**Exemplos**

- Utilização

```bash
$ dnsspoof [-i interface] [-f hostfile] [expression]
```

#### 4.9.3. ettercap

**Descrição**

Para mais informações, acesse os comandos de ajuda `man ettercap`e `ettercap --help`.

**Exemplos**

- Utilização

```bash

```

#### 4.9.4. wireshark

**Descrição**



Verifique o artigo [Dominando o Wireshark][4], criado para agrupar as melhores dicas e conteúdos dessa ferramenta poderosa de análise de tráfego de rede.

### 4.10. Post Exploitation

Essas ferramentas usam *backdoors* para voltar ao sistema vulnerável, ou seja, para manter o acesso à máquina. Como o nome sugere, eles são úteis ou usados ​​principalmente após um ataque ter sido feito anteriormente na máquina da vítima.

Por exemplo, depois que uma vítima de ataque removeu a vulnerabilidade do sistema, nessa situação, se o invasor quiser acessar os dados novamente, essas ferramentas serão úteis. Algumas das ferramentas são:

> **Nota:** a ferramenta mais famosa é o Powersploit.

#### 4.10.1. 

### 4.11. Forensics

Essas ferramentas são usadas por especialistas forenses para recuperar informações de qualquer sistema ou dispositivo de armazenamento. Isso ajuda na coleta de informações durante a busca de evidências de qualquer crime cibernético. Algumas das ferramentas são:

> **Nota:** a ferramenta mais famosa é a autópsia, que também tem sido usada por forças de segurança, muitos funcionários judiciais e investigadores.

#### 4.11.1. 

### 4.12. Reporting Tools

Após toda a avaliação e teste de vulnerabilidade os analistas têm que reportar tudo isso ao cliente de forma organizada e autenticada. Essas ferramentas desenvolvem estatísticas e informações para ajudar na análise. Algumas das ferramentas são:

> **Nota:** as ferramentas mais famosas são faraday, Dradis e Pipal.

#### 4.12.1. 

### 4.13. Social Engineering Tools

Como o nome sugere, essas ferramentas geram serviços semelhantes que as pessoas usam no dia a dia e extraem informações pessoais usando esses serviços falsos. Essas ferramentas usam e manipulam o comportamento humano para coleta de informações.

Por exemplo, o Phishing é um dos exemplos de engenharia social, nisso, uma página inicial de aparência semelhante de qualquer plataforma social é criada e, em seguida, os detalhes de login são comprometidos. Algumas das ferramentas são:

> **Nota:** a ferramenta de engenharia social mais famosa é o SET.

#### 4.13.1.

### 4.14. System Services

#### 4.14.1. 

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s2-diskpartrecommend-x86
[2]: https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
[3]: https://www.parrotsec.org/
[4]: ../Articles/wireshark.md

<!-- IMAGES -->