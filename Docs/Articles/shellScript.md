<!-- LOGO DIREITO -->
<a href="#do-básico-ao-avançado-no-shell-script"><img width="200px" src="../../Images/shellScript.png" align="right" /></a>

# Do básico ao avançado no Shell Script

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

👾 Aprenda a dominar o Shell Script com esse documento.

<!-- SUMÁRIO -->
- [Do básico ao avançado no Shell Script](#do-básico-ao-avançado-no-shell-script)
  - [1. Introdução](#1-introdução)
    - [1.1. O que é o Shell Script?](#11-o-que-é-o-shell-script)
    - [1.2. Vantagens](#12-vantagens)
    - [1.3. Desvantagens](#13-desvantagens)
  - [2. Básico](#2-básico)
  - [3. Variáveis](#3-variáveis)
    - [3.1. Operações matemáticas](#31-operações-matemáticas)
    - [3.2. Funções](#32-funções)
    - [Condicionais](#condicionais)
  - [4. Programa de automação real](#4-programa-de-automação-real)
  - [5. Estruturar um script](#5-estruturar-um-script)
  - [6. Fazer parsing de Strings](#6-fazer-parsing-de-strings)
  - [7. Expansão de variáveis](#7-expansão-de-variáveis)
  - [8. Removendo outputs para não poluir a tela](#8-removendo-outputs-para-não-poluir-a-tela)
  - [9. Exit codes](#9-exit-codes)
  - [10. Listas](#10-listas)
  - [11. Colorir o script](#11-colorir-o-script)

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Introdução

### 1.1. O que é o Shell Script?

Shell Script é uma linguagem de programação nativa do linux. Qualquer distribuição Linux que for utilizada, terá o **bash** nativamente instalado, e ele é o compilador dessa linguagem. Entretanto, também funciona em outros sistemas Unix-based:

- MacOS
- FreeBSD
- Solaris
- HP-UX

> **Nota:** o shell script é amplamente utilizado para automatizar tarefas maçantes do dia-a-dia.

### 1.2. Vantagens

Abaixo, estão apresentadas algumas das principais vantagens do shell script:

- Curva de aprendizado muito rápida;
- Tudo o que você faz no Terminal, é só colocar em um script e adicionar uma lógica;
- Muito rápido de escrever;
- Serve para SysAdmins e para usuários finais também;
- Mesmo sendo uma linguagem simples, você tem controle de fluxo, variáveis, comentários, arrays, funções...

### 1.3. Desvantagens

Já como desvantagens, têm-se:

- Não possui classes, threading, tipos de dados, como outras linguagens mais robustas tem (Python, Perl, Ruby...);
- Pode ser perigoso, dependendo da instrução escrita no script, já que roda tudo diretamente no sistema operacional;
- Não é muito intuitiva como outras linguagens.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Básico

## 3. Variáveis

Assim como em todas outras linguagens, as variáveis são utilizadas para armazenar valores. Especificamente no Shell Script, ela pode ser: ou um valor numérico, ou Strings de texto.

Geralmente, divide-se em duas partes (não há um *programming guide* para isso - apenas por experiência):

- **Globais**: declaradas em **maiúsculo** e todas as funções tem acesso;
- **Locais**: declaradas em **minúsculo** e somente a função tem acesso.

✍️ **EXEMPLO:**

```bash
$ NOME="Jonathan Silva" # Sem o export, variável somente para aquela sessão de bash
$ echo $NOME
> Jonathan Silva
$ bash # Para alterar a sessão bash
$ echo $NOME
>
$ exit
$ export NOME # Torna a variável global
$ bash 
$ echo $NOME
> Jonathan Silva
```

Entretanto, quando uma variável é declarada dentro de um script, ela vai estar disponível apenas dentro daquele script, nem com o `export`. Para cada execução de script, é criado uma nova sessão de bash e depois mata o processo da sessão.

Se só é declarado a variável localmente (sem o `export`), e dar o comando para mostrar as variáveis de ambiente (e.g. `env | grep NOME`), não será mostrado a variável criada por ela não é global.

> **Nota:** ao criar uma nova sessão, filha da atual, é possível personalizar a visualização dos processos que a envolve digitando `ps --forest`. Assim, uma sessão filha, enxerga todas as variáveis que são globais no pai.
> **Dica:** o export pode ser feito diretamente com `export NUMERO=1`.

### 3.1. Operações matemáticas

As operações matemáticas básicas podem ser realizadas da seguinte forma (entre muitas outras formas para bem fazê-las):

```bash
$ NUMERO_1=2
$ NUMERO_2=4
$ echo $(($NUMERO_1+$NUMERO_2)) # Soma as duas variáveis
> 6
```

E também pode ser colocado dentro de uma variável:

```bash
$ TOTAL=$(($NUMERO_1+$NUMERO_2)) # Variável que soma as duas variáveis anteriormente declaradas
$ echo $TOTAL
> 6
```

### 3.2. Funções

Funções dentro de Shell Script (como em qualquer outra linguagem) podem ser definidas como uma parte do código (ou código) que é responsável por uma ação específica. Elas são utilizadas para organizar o código. Com as funções, a manutenção do código é facilitada. Podem ser declarada direto no terminal da seguinte forma:

```bash
$ lla () {ls -la;} # Declarando a função lla para realizar o comando ls -la
$ lla
```

### Condicionais

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 4. Programa de automação real

## 5. Estruturar um script

## 6. Fazer parsing de Strings

## 7. Expansão de variáveis

## 8. Removendo outputs para não poluir a tela

## 9. Exit codes

## 10. Listas

## 11. Colorir o script

<!-- MARKDOWN LINKS -->
<!-- SITES -->

<!-- IMAGES -->