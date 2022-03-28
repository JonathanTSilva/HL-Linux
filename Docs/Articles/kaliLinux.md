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


<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Introdução

Kali Linux é uma distribuição GNU/Linux baseada no Debian, considerado o sucessor do Back Track. O projeto apresenta várias melhorias, além de mais aplicativos. É voltado principalmente para auditoria e segurança de computadores em geral. É desenvolvido e mantido pela Offensive Security Ltd. Desde 21 de janeiro de 2016, é uma distribuição "rolling-release", que remete basicamente à entrega contínua de um software.

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

## Instalação

Vale enfatizar a priori que o Kali Linux possui uma versão Live para instalação em dispositivos remotos. Entretanto, para uma instalação normal do sistema operacional em disco, é necessários seguir os procedimentos padrões para isso:

- Criar um USB Bootável com o Kali Linux (Ventoy, Rufus, Win32 - ou com o comando no Linux: `dd if=<nomeISO> of=/dev/<nome> bs=512k`);
- Iniciar sistema pelo bootável;
- Instalar o Kali;
- Selecione todas as configurações iniciais;
- Por boas práticas, particione o seu disco manualmente seguindo [recomendações do RedHat][1];
- Finalize a instalação.

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s2-diskpartrecommend-x86

<!-- IMAGES -->