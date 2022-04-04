<!-- LOGO DIREITO -->
<a href="#"><img width="300px" src="https://miro.medium.com/max/1400/1*im7iEQTE1ailvUw4XL9r6g.png" align="right" /></a>

# Dominando o WireShark

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

🦈 Conheça as principais funcionalidades e utilizações do Wireshark e torne ele uma das suas principais ferramentas.

<!-- SUMÁRIO -->

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Introdução

É notório que, cada vez mais, profissionais da área de redes, operadores e engenheiros experientes em todo o mundo estejam utilizando o Wireshark em sua maleta de ferramentas. Esta ferramenta poderosa para análise de rede (captura de pacotes) pode capturar todo o tráfego e interpretá-lo para decodificar as mensagens transportadas pelos diversos protocolos existentes.

### 1.1. O que é análise de rede e de protocolo?

De acordo com o texto retirado do [Guia prático de Wireshark - Análise e resolução de problemas de tráfego de rede][1], de Robert Shimonski, a análise rede e/ou protocolo corresponde a um conjunto de técnicas que engenheiros e profissionais da área de redes utilizam para estudar as propriedades das redes, incluindo conectividade, capacidade e desempenho. As análises de rede podem ser utilizadas para estimar a capacidade de uma rede, observar características de desempenho ou planejar aplicações futuras.

Um analisador de rede geralmente oferecem os seguintes recursos:

- capturar e decodificar dados em uma rede;
- analisar atividades de rede que envolvam protocolos específicos;
- gerar e apresentar estatísticas sobre a atividade da rede;
- realizar análise de padrões de atividade da rede.

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Instalação

A instalação do Wireshark pode ser efetivada de maneira muito simples. O download dos arquivos para todos os sistemas operacionais pode ser feito através do [site oficial do software][2].

Entretanto, para ambientes baseados em Debian/Ubuntu, por exemplo, pode ser realizado através da linha de comando:

```bash
sudo apt install wireshark
```

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Básico

### 3.1. Criando regras coloridas

Existem dois tipos de regras que podem ser criadas: as permanentes e as temporárias, sendo auto-explicativas pelos nomes.

Para criar uma regra, siga os seguintes passos:

- **Analyse** > **Display Filter Expression...**;
- Aqui está todas as relações de regras de expressões que existem;
- Crie a sua regra a partir daqui (confira o exemplo abaixo);
  - **TCP - Transmission Control Protocol** > **tcp.analysis.fast_retransmission - Expert info**;
  - **is present** > **OK** > **enter**;
  - Perceba que sua regra de filtro vai para a barra superior do Wireshark. Ali, é possível editar os seus filtros manualmente:
    - **tcp.analysis.fast_retransmission or tcp.analysis.duplicate_ack**.
- Tendo o seu filtro em mãos, entrar no menu:
  - **View** > **Coloring Rules**;
  - **New coloring rule** > Colar o filtro na opção **Filter** > Alterar o nome da regra > **OK**;

Aqui, estará a tabela padrão de regras já existente:

![A][A]

Vale ressaltar que a ordem das regras nessa tela significa a prioridade da regra para o item. Por exemplo, caso exista três regras para um determinado item, e as três estão validadas ao mesmo tempo, a primeira a aparecer será pela ordem de cima para baixo do quadro de regras.



<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://issuu.com/novateceditora/docs/capitulo9788575223888
[2]: https://www.wireshark.org/

<!-- IMAGES -->
[A]: ../../Images/wireshark01.png