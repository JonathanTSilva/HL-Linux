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
    - [2.1. Variáveis](#21-variáveis)
    - [2.2. Operações matemáticas](#22-operações-matemáticas)
    - [2.3. Funções](#23-funções)
    - [2.4. Condicionais](#24-condicionais)
    - [2.5. Laços](#25-laços)
  - [3. Programa de automação real](#3-programa-de-automação-real)
    - [Pré-requisitos](#pré-requisitos)
  - [4. Estruturar um script](#4-estruturar-um-script)
  - [5. Fazer parsing de Strings](#5-fazer-parsing-de-strings)
  - [6. Expansão de variáveis](#6-expansão-de-variáveis)
  - [7. Removendo outputs para não poluir a tela](#7-removendo-outputs-para-não-poluir-a-tela)
  - [8. Exit codes](#8-exit-codes)
  - [9. Listas](#9-listas)
  - [10. Colorir o script](#10-colorir-o-script)

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

### 2.1. Variáveis

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

### 2.2. Operações matemáticas

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

### 2.3. Funções

Funções dentro de Shell Script (como em qualquer outra linguagem) podem ser definidas como uma parte do código (ou código) que é responsável por uma ação específica. Elas são utilizadas para organizar o código. Com as funções, a manutenção do código é facilitada. Podem ser declarada direto no terminal da seguinte forma:

```bash
$ lla () {ls -la;} # Declarando a função lla para realizar o comando ls -la
$ lla
```

### 2.4. Condicionais

Condicionais são utilizadas para definir o fluxo de execução de um script. No Shell Script. possui as mesmas funções das condicionais de outras linguagens de programação. Exemplo:

```bash
if [[ -d /var ]]; then
- echo "Diretório existe"
else
- echo "Diretório não existe"
fi
```

> **Nota:** o shell script em si não testa apenas condições, mas também instruções.
> **Nota:** ao observar o código acima, verifica-se os espaços e os colchetes, que representam o comando `test` do shell. Se eles não forem colocados, o código não será executado.

O `-d` atrelado ao `if`, é para testar se o diretório existe. Caso seja adicionado o sinal `!` antes deste comando, é retornado false daquela expressão.

Abaixo, a tabela apresenta as principais expressões que existem no shell script.

<p align="center">
  <a href="#"><img width="400px" src="../../Images/shellCond.png"/></a>
</p>

> **Dica:** o comando `man bash` retorna todas as funções e opções existentes para o shell script.

Exemplo de utilização do comando `test`:

```bash
$ mkdir pasta
$ test -d pasta # Testa se existe esse diretório
$ echo $? # O resultado do comando anterior é guardado em $?
> 0 # Se retorna zero, é verdadeiro. Qualquer coisa diferente de zero é falso
$ test -d pastaXYS
> 1 # Falso
```

### 2.5. Laços

São utilizados para executar várias vezes o mesmo código, varrer uma lista de valores, etc... No shell script há três laços: **until**, **for** e **while**. Exemplo diferentes para a mesma situação:

```bash
for i in $(seq 10); do
- echo "Contador = $i"
done
```

> **Nota:** o `seq` é um comando que vai executar o comando por tantas vezes.

```bash
i=0
while [[ $i -lt 10 ]]; do
- echo "Contador = $i"
- i=$(($i+1))
done
```

> **Nota:** o `while` não apresenta um contator (`seq`) como o for, por isso é necessário comandos a mais.

```bash
i=0
until false
do
- echo "Contador = $i"
- ((i++))
- sleep 2
done
```

Exemplo real para trazer todos os usuários do sistema:

```bash
for usuario in $(cut -d : -f 1 /etc/passwd); do # Pega a primeira coluna de todos os usuários do sistema
- echo "Usuário: $usuario";
done
```

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Programa de automação real

### Pré-requisitos

Para viés didático, criou-se uma máquina virtual para realizar todo o estudo envolvendo Shell Script, marcando um snapshot para facilitar o backup da fase inicial da estação. Para isso, utilizou-se o VirtualBox e as seguintes configurações de VM:

- Sistema Operacional: Ubuntu 21.02;
- Memória RAM: 2 GiB;
- Disco: 50 GB;
- Memória de Vídeo: 128 MB.

Além disso, a preparação do checkpoint inicial da máquina deve conter:

- OpenSSH - para acessá-la remotamente;
- Editor de código - de sua preferência (Vim, Nano, entre outros);
  - Caso utilize o editor pela máquina cliente (como o VSCode, Atom, etc.), opte por instalar extensões que facilite a edição com conexões SSH.
- Net-tools - para facilitar os comandos de rede

## 4. Estruturar um script

## 5. Fazer parsing de Strings

## 6. Expansão de variáveis

## 7. Removendo outputs para não poluir a tela

## 8. Exit codes

## 9. Listas

## 10. Colorir o script

<!-- MARKDOWN LINKS -->
<!-- SITES -->

<!-- IMAGES -->