<!-- LOGO DIREITO -->
<a href="#como-adicionar-dns-ao-meu-servidor"><img width="200px" src="../../Images/dns.png" align="right" /></a>

# Construa sua própria conexão VPN

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

🌉 Passos para preparar um ambiente com VPN para suas estações.

<!-- SUMÁRIO -->

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Introdução

### 1.1. O que é VPN?

### 1.2. Para que utilizar VPN?

Algumas das vantagens na utilização das VPNs são:

- **Equipamento Doméstico** — de vez em quando me deparo com a necessidade de imprimir uma fatura ou um E-ticket que preciso usar para meu uso pessoal… para isso e outros a opção preferida é imprimir em casa.
- **Internet segura** — Caso você esteja em um WiFi de internet pública e queira executar uma conexão segura com seu banco ou outros sites confidenciais, redirecionar seu tráfego através de sua casa por um túnel criptografado soa como a melhor maneira de manter seus dados seguros.
- **Jogos** — em alguns casos, os jogadores pagam mais ao ISP por um IP estático para receber uma melhor qualidade de serviço para sua conexão com a Internet. A única maneira de garantir o uso de IP estático é estabelecer um túnel VPN para nossa rede doméstica e redirecionar todo o tráfego da Internet por meio desse túnel. Dessa forma, enquanto você não estiver em sua rede doméstica LAN, toda conexão que você fizer a um endereço público será identificada como se você estivesse se conectando de casa.

### 1.2. OpenVPN

O OpenVPN é um dos, senão o servidor VPN mais usado no mercado, existem dezenas de tutoriais e páginas de suporte sobre ele e as empresas podem escolhê-lo como porta de entrada para sua organização. Além disso, é gratuito (existe uma versão comercial para grandes/médias empresas) e fácil de configurar.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. OpenVPN no Windows

- O primeiro passo, é realizar o download do OpenVPN no [site oficial][1];
- A instalação é realizada normalmente; (sempre marcar a instalação do adaptador virtual);
- A instalação gera uma pasta na sua pasta de usuário, na qual devem ser armazenadas as pastas de client: `%UserProfile%\OpenVPN\config\<colar aqui a pasta do client>`
  - Geralmente, dentro dessa pasta há o certificado, a chave de conexão e o cliente de conexão em si, que possui as configurações de acesso.

### 2.1. Servidor

### 2.2. Cliente

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. OpenVPN no Linux

https://two-oes.medium.com/how-to-setup-a-vpn-connection-with-openvpn-d2944b5ca768

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://openvpn.net/community-downloads/

<!-- IMAGES -->