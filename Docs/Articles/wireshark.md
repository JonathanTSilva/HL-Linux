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

### 3.2. Usando filtros de exibição

Os filtros de exibição (`Analyze`) se diferem dos filtros de captura (`Capture`), que são aplicados no momento da captura do tráfego, selecionando quais pacotes serão recolhidos. Os de exibição são aplicados após a captura do tráfego, analisando e exibindo as informações filtradas depois da requisição destes pacotes. Após remover os filtros de exibição, todos os pacotes ainda estarão lá.

**Composição básica da sintaxe**

- Protocolo (IP, porta de pesquisa, SNMP, FTP, etc);
- String (`dst`, `src`, `tcp`, etc);
- Relação;
  - Expressões Matemáticas:
    - `==` (igual a);
    - `!=` (não igual a);
    - `>` (maior que);
    - `<` (menor que);
    - `>=` (maior ou igual a);
    - `<=` (menor ou igual a).
- Resultado (`10.0.0.1`);
- Condições:
  - Is present (está presente);
  - Contains (contém - não pode ser utilizado em campos diferentes);
  - Matches (correspondências - permitem que o filtro se aplique em uma expressão regular).
- Combinações de filtros:
  - AND;
  - OR;
  - XOR;
  - NOT.

**Exemplo**

```cmd
ip.src == 10.0.0.1 and tcp.port == 80
!(udp.port == 443) and udp
```

Há uma forma de facilitar esses comandos utilizados com frequência, adicionando-os como atalhos na barra de ferramenta ao clicar no botão `+` ao lado da barra de filtros. Além disso, esses atalhos de filtros podem ser editados pela janela **Edit** > **Preferences** > **Filter Buttons**.

Existem três tipos de filtros de exibição diferentes:

1. Filtros padrão;
2. Filtros de expressão;
3. Filtros direto dos pacotes (clicando com o botão direito nas informações do pacote e selecionar **Apply as filter**).

> **Nota:** para mais informações, verifique a página de [filtros do Wireshark][3].

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://issuu.com/novateceditora/docs/capitulo9788575223888
[2]: https://www.wireshark.org/
[3]: https://www.wireshark.org/docs/man-pages/wireshark-filter.html

<!-- IMAGES -->
[A]: ../../Images/wireshark01.png