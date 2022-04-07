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

Note que para o ambiente windows, é perguntado se pode ser instalado dois softwares complementares:

- USBpcap - é um sniffer USB de código aberto para Windows, e
- Npcap - Biblioteca de captura (e envio) de pacotes do Nmap Project para Microsoft Windows.

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

### 3.3. Perfis de configuração

Os perfis de configuração definirão suas preferências pessoais para cada projeto, facilitando o processo e o otimizando o tempo de configuração. Os perfis estão ligados com as colunas de exibição, filtros e interfaces com o usuário. Exemplo, um perfil para desempenho, outro para análise do tráfego para o protocolo UDP, outro para Wireless, entre outros.

Para adicionar colunas, sem ligá-las com perfis, basta clicar com o botão direito em algum parâmetro do pacote, na aba de **Packet Details**, e selecionar **Apply as Column** (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>I</kbd>). Note que foi acrescentado uma coluna na visualização, com aquele determinado parâmetro. Entretanto, vale ressaltar que esta coluna estará em todas as análises de pacotes (mesmo para as que não possuem aquele parâmetro), e sumirá na próxima reinicialização do software. Da mesma forma ocorre para filtros e outras interfaces com usuário. Para resolver tal problema, adicionar perfis.

Para criar um novo perfil, clicar na aba **Edit** e **Configuration Profiles**. Ao adicionar um novo, é criado um perfil por base no default, sendo necessárias modificações para este perfil atual.

Para alterar facilmente entre os perfis, pode-se clicar no canto inferior direito e manusear todas as configurações para isso.

Os arquivos que são salvos para cada perfil são:

- colorfilters
- decode_as_entries
- dfilter_buttons
- dfilters
- language
- preferences
- recent
- recent_common

> **Nota:** para compartilhar algum perfil criado, acesse a pasta de configuração do Wireshark (**Help** > **About Wireshark** > **Folders** > **Personal configuration**) e copiar os arquivos da pasta (perfil) que lhe interessa.

> **Atenção:** para restaurar o perfil **default**, abra a pasta de configuração de perfis (**Help** > **About Wireshark** > **Folders** > **Personal configuration**) e elimine os arquivos de configuração `colorfilters`, `dfilters` e `preferences`, deixando apenas os filtros `language`, `recent` e `recent_common`. Assim, ao abrir novamente o perfil **default**, estes arquivos são resetados.

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://issuu.com/novateceditora/docs/capitulo9788575223888
[2]: https://www.wireshark.org/
[3]: https://www.wireshark.org/docs/man-pages/wireshark-filter.html

<!-- IMAGES -->
[A]: ../../Images/wireshark01.png