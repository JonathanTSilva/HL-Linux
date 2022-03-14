<!-- LOGO DIREITO -->
<a href="#do-básico-ao-avançado-no-shell-script"><img width="200px" src="../../Images/shellScript.png" align="right" /></a>

# Do básico ao avançado no shell script

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

👾 Aprenda a dominar o *shell script* com esse documento.

<!-- SUMÁRIO -->
- [Do básico ao avançado no shell script](#do-básico-ao-avançado-no-shell-script)
  - [1. Introdução](#1-introdução)
    - [1.1. O que é o shell script?](#11-o-que-é-o-shell-script)
    - [1.2. Vantagens](#12-vantagens)
    - [1.3. Desvantagens](#13-desvantagens)
  - [2. Básico](#2-básico)
    - [2.1. Comandos básicos](#21-comandos-básicos)
    - [2.2. Variáveis](#22-variáveis)
      - [2.2.1. Variáveis especiais](#221-variáveis-especiais)
      - [2.2.2. Variáveis "instantâneas"](#222-variáveis-instantâneas)
    - [2.3. Operações matemáticas](#23-operações-matemáticas)
    - [2.4. Funções](#24-funções)
    - [2.5. Condicionais](#25-condicionais)
    - [2.6. Laços](#26-laços)
    - [2.7. Diferenças de sintaxe](#27-diferenças-de-sintaxe)
  - [3. Programa de automação real](#3-programa-de-automação-real)
    - [3.1. Pré-requisitos](#31-pré-requisitos)
    - [3.2. Primeiro código](#32-primeiro-código)
    - [3.3. Primeiro script - pratica1.sh`](#33-primeiro-script---pratica1sh)
    - [3.4. Aprimoramento do primeiro script](#34-aprimoramento-do-primeiro-script)
      - [3.4.1. Adicionar variáveis - pratica2.sh](#341-adicionar-variáveis---pratica2sh)
      - [3.4.2. Adicionar funções - pratica3.sh](#342-adicionar-funções---pratica3sh)
      - [3.4.3. Exit codes](#343-exit-codes)
      - [3.4.4. Aplicar condicionais - pratica4.sh](#344-aplicar-condicionais---pratica4sh)
      - [3.4.5. Lista de pacotes - pratica5.sh](#345-lista-de-pacotes---pratica5sh)
      - [3.4.6. Parsing de URL - pratica6.sh](#346-parsing-de-url---pratica6sh)
      - [3.4.7. Teste de requisitos - pratica7.sh](#347-teste-de-requisitos---pratica7sh)
      - [3.4.8. Redirecionamento de comandos](#348-redirecionamento-de-comandos)
      - [3.4.9. Tratando as saída do script - pratica8.sh](#349-tratando-as-saída-do-script---pratica8sh)
      - [3.4.10. Colorindo o script - prática9](#3410-colorindo-o-script---prática9)
      - [3.4.11. Organização do código](#3411-organização-do-código)
  - [4. Avançado](#4-avançado)
    - [4.1. Configurando parâmetros](#41-configurando-parâmetros)
  - [5. Exercícios](#5-exercícios)
    - [5.1. Obter informações do computador](#51-obter-informações-do-computador)
    - [5.2. Obter o IP local](#52-obter-o-ip-local)
    - [5.3. Obter a memória](#53-obter-a-memória)
    - [5.4. Obter nomes e endereços de memória](#54-obter-nomes-e-endereços-de-memória)
    - [5.5. Obter portas e serviços](#55-obter-portas-e-serviços)
    - [5.6. Criptografia de *string*](#56-criptografia-de-string)
      - [5.6.1. Criptografar uma *string*](#561-criptografar-uma-string)
      - [5.6.2. Descriptografar uma *string*](#562-descriptografar-uma-string)
    - [5.7. Quebrar senhas](#57-quebrar-senhas)
    - [5.8. Mapear rede interna](#58-mapear-rede-interna)
    - [5.9. Requisitar informações WEB](#59-requisitar-informações-web)
    - [5.10. Proteger de ataques *defacement* (*deface*)](#510-proteger-de-ataques-defacement-deface)
    - [5.11. Proteger de invasor de porta](#511-proteger-de-invasor-de-porta)

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Introdução

### 1.1. O que é o shell script?

*Shell script* é uma linguagem de programação nativa do linux. Qualquer distribuição Linux que for utilizada, terá o **bash** nativamente instalado, e ele é o compilador dessa linguagem. Entretanto, também funciona em outros sistemas Unix-based:

- MacOS;
- FreeBSD;
- Solaris;
- HP-UX.

> **Nota:** o *shell script* é amplamente utilizado para automatizar tarefas maçantes do dia-a-dia.

Também se destaca pelas seguintes características:

- Disponibilidade;
- Objetividade;
- Fora da caixa - funciona de uma maneira muito diferente de qualquer outra linguagem;
- Poder.

### 1.2. Vantagens

Abaixo, estão apresentadas algumas das principais vantagens do *shell script*:

- Curva de aprendizado muito rápida;
- Tudo o que você faz no Terminal, é só colocar em um *script* e adicionar uma lógica;
- Muito rápido de escrever;
- Serve para SysAdmins e para usuários finais também;
- Mesmo sendo uma linguagem simples, você tem controle de fluxo, variáveis, comentários, arrays, funções...

### 1.3. Desvantagens

Já como desvantagens, têm-se:

- Não possui classes, threading, tipos de dados, como outras linguagens mais robustas tem (Python, Perl, Ruby...);
- Pode ser perigoso, dependendo da instrução escrita no *script*, já que roda tudo diretamente no sistema operacional;
- Não é muito intuitiva como outras linguagens.

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Básico

### 2.1. Comandos básicos

Inicialmente, é necessário tomar conhecimento de alguns comandos que podem aparecer no decorrer deste estudo. Abaixo estão os comandos mais utilizados nesta linguagem:

- `echo`
  - **Descrição:** exibe uma mensagem na tela. Delimitar com ". Sem argumento, exibe uma linha em branco.
  - **Parâmetros:**
    - `-e`: cores e caracteres de controle (`echo -e "inserir quebra\n de linha"`);
    - `-n`: não quebra a linha.
- `printf`
  - **Descrição:** exibe uma mensagem na tela, exatamente como ela é. Permite diversas quebras de linha. Delimitar com ". Por padrão, ele interpreta os caracteres de controle.
- `read`
  - **Descrição:** lê uma entrada do usuário e a salva em uma variável
  - **Parâmetros:**
    - `-p`: mostra uma mensagem (`read -p "Qual a sua idade" idade`);
    - `-s`: não exibe o valor ao digitar (`read -s -p "Qual a sua senha" senha`);
    - `-t`: aguarda por um tempo determinado (`read -t 3 opcao`).
- `cat`
  - **Descrição:** mostra o conteúdo de um arquivo.
  - **Parâmetros:**
    - `-n`: enumera as linhas (`cat`).
- `head`
  - **Descrição:** mostra as 10 primeiras linhas do arquivo.
  - **Parâmetros:**
    - `-n`: mostra **n** primeiras linhas;
    - `-c`: mostra **n** primeiros caracteres.
- `tail`
  - **Descrição:** mostra as 10 últimas linhas do arquivo.
  - **Parâmetros:**
    - `-n`: mostra **n** últimas linhas;
    - `-c`: mostra **n** últimos caracteres.
- `grep`
  - **Descrição:** encontra linhas que contenham uma string específica.
  - **Parâmetros:**
    - `-v`: encontra linhas que não tenham a string (`ls | grep -v "Pr"`);
    - `--color`: colore a string nos resultados (`ls | grep --color "Pr"`).
- `cut`
  - **Descrição:** corta uma string em pedaços.
  - **Parâmetros:**
    - `-d`: delimitador (`echo "um dois tres quatro cinco" | cut -d" " -f1-3,5`);
    - `-f`: index;
    - `-b`: caracteres (`echo "um dois tres quatro cinco" | cut -b 1-5`).
- `tr`
  - **Descrição:** substitui um caractere por outro (`echo "um dois tres quatro cinco" | tr " " "\n"`).
  - **Parâmetros:**
    - `-d`: deleta um caractere (`echo "um dois tres quatro cinco" | tr -d " "`).
- `sed`
  - **Descrição:** .
  - **Parâmetros:**
    - as

### 2.2. Variáveis

Assim como em todas outras linguagens, as variáveis são utilizadas para armazenar valores. Especificamente no *shell script*, ela pode ser: ou um valor numérico, ou Strings de texto.

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

Entretanto, quando uma variável é declarada dentro de um *script*, ela vai estar disponível apenas dentro daquele, nem com o `export`. Para cada execução de *script*, é criado uma nova sessão de bash e depois mata o processo da sessão.

Se só é declarado a variável localmente (sem o `export`), e dar o comando para mostrar as variáveis de ambiente (e.g. `env | grep NOME`), não será mostrado a variável criada por ela não é global.

> **Nota:** ao criar uma nova sessão, filha da atual, é possível personalizar a visualização dos processos que a envolve digitando `ps --forest`. Assim, uma sessão filha, enxerga todas as variáveis que são globais no pai.
> **Dica:** o export pode ser feito diretamente com `export NUMERO=1`.

#### 2.2.1. Variáveis especiais

Existem algumas variáveis especiais no sistema que são variáveis apenas de leitura, ou seja, só pode-se obter o seu valor, e não atribuir. Abaixo, estão algumas das variáveis mais utilizadas em **bash**:

| Variável  | Descrição                                                                                                                                                                                                                                                                                        |
| :-------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `$*`      | Todos os valores do "argumentos" que foram passados ao script, ao ser chamado pela linha de comando, sendo eles, separados por ” ” (um espaço). Esta variável já não é muito usada pois costuma induzir em erro. A próxima variável é usada em seu lugar.                                        |
| `$@`      | Todos os valores do "argumentos" que foram passados ao script, ao ser chamado pela linha de comando, sendo eles, separados por ” ” (um espaço).                                                                                                                                                  |
| `$#`      | Número de argumentos passados ao script. A contagem começa em 1, não em 0. É um numero na base decimal.                                                                                                                                                                                          |
| `$?`      | ErrorLevel do último comando                                                                                                                                                                                                                                                                     |
| `$$`      | Valor do ID do seu próprio processo. Pode ser usada para construir uma lógica de comunicação entre processos. Cada processo seria identificado pelo seu ID de processo, enviando aos outros o processo a que devem responder, e visse versa.                                                     |
| `$!`      | Valor do ID do último comando executado de forma assíncrona.                                                                                                                                                                                                                                     |
| `$0`      | Nome/caminho do script                                                                                                                                                                                                                                                                           |
| `$_`      | Antes de nada ser executado, contem o caminho e nome do script (ou shell) pelo qual foi chamado na linha de comando. Depois, no decorrer do script, esta variável contem o valor do último argumento do último comando que foi executado. Além disso, esta variável é exportada para o ambiente. |
| `$1`-`$9` | Argumentos passados                                                                                                                                                                                                                                                                              |

#### 2.2.2. Variáveis "instantâneas"

Dentro do shell, há um truque que permite a execução de uma variável que não tem nome; guardam um valor, mas não carregam nome algum. A sintaxe para essas variáveis é: `$()` e `$(())`. Veja os exemplos.

```shell
$ echo $(ls)
> # Resultado do comando ls
$ uname
> Linux
$ echo "Variável instantânea: $(uname)"
> Variavel instantânea: Linux
$ echo $((2+2))
> 4
```

Note que, a variável instantânea com aspas duplas (`$(())`) é utilizada para realizar cálculos. Também pode ser utilizado uma dentro da outra, ou seja, realizar cálculos de outras variáveis instantânea (`$(( $()+$() ))`).

> **Nota:** a variável instantânea é deletada após sua execução.

### 2.3. Operações matemáticas

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

### 2.4. Funções

Funções dentro de *shell script* (como em qualquer outra linguagem) podem ser definidas como uma parte do código (ou código) que é responsável por uma ação específica. Elas são utilizadas para organizar o código. Com as funções, a manutenção do código é facilitada. Podem ser declarada direto no terminal da seguinte forma:

```bash
$ lla () {ls -la;} # Declarando a função lla para realizar o comando ls -la
$ lla
```

### 2.5. Condicionais

Condicionais são utilizadas para definir o fluxo de execução de um *script*. O *shell script*, possui as mesmas funções das condicionais de outras linguagens de programação. Exemplo:

```shell
if [[ -d /var ]]; then
- echo "Diretório existe"
else
- echo "Diretório não existe"
fi
```

```shell
case $var in
- op1) comando;;
- op1) comando;;
- op1) comando;;
[...]
*) comando padrao;
esac
```

> **Nota:** o *shell script* em si não testa apenas condições, mas também instruções.
> **Nota:** ao observar o código acima, verifica-se os espaços e os colchetes, que representam o comando `test` do shell. Se eles não forem colocados, o código não será executado.

O `-d` atrelado ao `if`, é para testar se o diretório existe. Caso seja adicionado o sinal `!` antes deste comando, é retornado false daquela expressão.

Abaixo, a tabela apresenta as principais expressões que existem no *shell script*.

<p align="center">
  <a href="#"><img width="400px" src="../../Images/shellCond.png"/></a>
</p>

> **Dica:** o comando `man bash` retorna todas as funções e opções existentes para o *shell script*.

Exemplo de utilização do comando `test`:

```bash
$ mkdir pasta
$ test -d pasta # Testa se existe esse diretório
$ echo $? # O resultado do comando anterior é guardado em $?
> 0 # Se retorna zero, é verdadeiro. Qualquer coisa diferente de zero é falso
$ test -d pastaXYS
> 1 # Falso
```

### 2.6. Laços

São utilizados para executar várias vezes o mesmo código, varrer uma lista de valores, etc... No *shell script* há três laços: **until**, **for** e **while**. Exemplo diferentes para a mesma situação:

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

### 2.7. Diferenças de sintaxe

No *shell script*, é comum existir várias aplicações para diferentes sintaxes, e uma das que mais causam dúvidas nos programadores é a diferença entre aspas duplas e simples.

- Aspas simples servem para a expressão ser literalmente o que ela é, sem considerar nome de variáveis.
- Aspas duplas servem para a expressão converter nomes de variáveis para seu conteúdo.

Exemplo:

```bash
$ echo '$VAR é legal.'
> $VAR é legal.
$ echo "$VAR é legal."
> Linux é legal. # Retorna a variável $VAR
```

Sempre quando uma variável é declarada com aspas, é recomendado que ela seja utilizada com aspas também. Como exemplo:

```bash
$ NOME="Jonathan
Silva"
$ echo $NOME
> Jonathan Silva
$ echo "$NOME"
> Jonathan
> Silva
```

Por isso que é muito importante utilizar sempre as aspas para manter a variável em sua formatação original, até mesmo em $(subshells). Quando for preciso referenciar variáveis sem aspas, utilize comentários para explicar a exceção e faça isso apenas quando for estritamente necessário.

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Programa de automação real

Este capítulo aborda um exemplo de utilização real de *shell script*, para automatizar a configuração posterior à uma instalação do Ubuntu.

### 3.1. Pré-requisitos

Para viés didático, criou-se uma máquina virtual para realizar todo o estudo envolvendo *shell script*, marcando um snapshot para facilitar o backup da fase inicial da estação. Para isso, utilizou-se o VirtualBox e as seguintes configurações de VM:

- Sistema Operacional: Ubuntu 21.02;
- Memória RAM: 2 GiB;
- Disco: 50 GB;
- Memória de Vídeo: 128 MB.

Além disso, a preparação do checkpoint inicial da máquina deve conter:

- OpenSSH - para acessá-la remotamente;
- Editor de código - de sua preferência (Vim, Nano, entre outros);
  - Caso utilize o editor pela máquina cliente (como o VSCode, Atom, etc.), opte por instalar extensões que facilite a edição com conexões SSH;
- Net-tools - para facilitar os comandos de rede.

### 3.2. Primeiro código

A primeira coisa a ser feita na fase de planejamento de um *script*, é replicar, pausadamente, todos os comandos no terminal. Se tudo ocorrer bem nesta etapa, poderá ser passada para o Script, melhorando a solução. Como exemplo, para a automação proposta neste capítulo, há estes comandos:

```shell
sudo rm /var/lib/dpkg/lock-frontend # Remove este arquivo de lock, pois possivelmente, um processo do apt e dpkg está bloqueado e impossibilitando alteração
sudo rm /var/cache/apt/archives/lock
sudo dpkg --add-architecture i386 # Como a arquitetura dos softwares são todas em 64 bits atualmente, os programas que foram desenvolvidos para 32 bits não funcionam. Por isso é preciso adicionar essa arquitetura (i386 = 32 bits)
sudo apt update -y # Atualiza todo o repositório de pacotes
sudo add-apt-repository ppa:libratbag-piper/piper-libratbag-git -y # Adicionar o repositório do piper (gestor dos mouses da Logitech)
sudo add-apt-repository ppa:lutris-team/lutris -y # Adicionar o repositório do Lutris (gestor de jogos livre e de código aberto)
sudo apt update -y # Atualizar novamente os pacotes, agora com os novos repositórios ppa
mkdir /home/jonathan/Downloads/softwares # Cria o novo diretório para baixar os softwares
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /home/jonathan/Downloads/softwares # Baixa o Google Chrome utilizando wget
wget https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb -P /home/jonathan/Downloads/softwares # Baixa o SimpleNote utilizando wget
sudo dpkg -i /home/jonathan/Downloads/softwares/*.deb # Instala esses programas
sudo apt -f install -y # Instala todas as dependências desses programas (pois alguns podem não carregar as dependências)
sudo apt install snapd -y # Instala o snap direto do apt
sudo apt install winff -y # Instala o winff (conversor de vídeos e áudios) direto do apt
sudo apt install guvcview -y # Instala o guvcview (aplicativo de webcam) direto do apt
sudo apt install virtualbox -y # Instala o virtualbox direto do apt
sudo snap install spotify # Instala o spotify com o Snap
sudo apt update && sudo apt dist-upgrade -y # Atualizar os pacotes e a distribuição
sudo apt autoclean # Limpa o cache do sistema
sudo apt autoremove -y # Limpa os pacotes que não são mais necessários
```

### 3.3. Primeiro script - [pratica1.sh`][1]

Após ter executado todos os comandos da seção acima, vamos criar o primeiro *script* para automatizar aquele processo.

O *shell script* geralmente tem a extensão `.sh`. Assim, como primeiro passo, copie aqueles comandos anteriores dentro deste primeiro arquivo, que para fins didáticos, será nomeado como [pratica1.sh][1]. Assim, siga os seguintes passos para finalizar o primeiro *script* dentro dos padrões de desenvolvimento:

1. Sempre a primeira linha será definida pela declaração do compilador responsável por rodar aquele *script* (bash, zshell, fish etc.), através de um **shebang**: `#!/bin/bash/`;

> **Nota:** para verificar qual o local do seu shell, utilizar o comando `which [shell]`.

2. Após criado o Script, se tentar inciar ele pelo terminal com `./pratica1.sh`, um erro de permissão negada será mostrado. Isso acontece porque todo novo Script, tem apenas permissão de leitura (verificar com o `ls -l`). Para alterar a permissão, rodar `chmod +x pratica1.sh`;

> **Nota:** ao alterar a permissão e dar o comando `ls`, o arquivo que tem permissão de execução será mostrado de forma destacada.

Pronto! Temos o primeiro *shell script* para executar as tarefas de forma automática, mas ainda fora das boas práticas. Note que para rodar um *script* precisamos do `./`. Há uma outra forma de rodar ele, que independe do **shebang**: basta adicionar o compilador antes de chamar o arquivo por linha de comando (e.g. `bash pratica1.sh`).

> **Dica:** para executar um arquivo em background, isto é, sem aparecer na linha de comando, adicionar o caractere `&` depois da chamada. Exemplo: `./script.sh &`. Assim, será executado como um processo, ganhando um PID (pode ser visualizado com `ps`). Entretanto, caso o *script* já tenha sido iniciado, realizar os seguintes passos para mandá-lo para *background:*

```shell
$ ./script.sh
> 
# Clicar Ctrl+Z
> [1]+  Parado               ./script.sh
# Caso não apareça a descrição acima, utilizar o comando:
$ jobs
> [1]+  Parado               ./script.sh
# Tendo o identificador do processo (neste caso 1), dar
$ bg 1
# Da mesma forma, utilizar o comando fg [ID] para trazer para foreground
```

Entretanto, alguns programadores preferem, pela praticidade, também automatizar esse processo criando um diretório para os *scripts* (geralmente chamado `~/.bin/`) e adiciona-lo à variável `PATH`, para que seja lido em qualquer lugar. Para isso, realizar os seguintes passos no terminal:

```bash
$ echo $PATH
> /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:[...]
# Criar pasta para os scripts
$ mkdir ~/.bin
# Copiar todos os seus scripts para dentro do .bin, neste caso:
$ cp pratica1.sh ~/.bin/
# Colocar o diretório .bin dentro da variável PATH:
$ export PATH=$PATH:/home/jonathan/.bin
# Executar o script
$ pratica1.sh
```

### 3.4. Aprimoramento do primeiro script

Nas próximas fases deste capítulo, vamos aperfeiçoar o *script* realizado na seção anterior, adicionando estrutura, varáveis, funções etc. ao código, comentando e organizando da melhor maneira.

#### 3.4.1. Adicionar variáveis - [pratica2.sh][2]

Em uma situação real, imagine que, na linha que adiciona o repositório `ppa`, seja alterado por parte da organização fornecedora, o endereço desse. Seria necessária edição no código toda vez que isso acontecesse. Pior ainda, imagina se esse link fosse utilizado muitas vezes ao longo do script...

Para contornar tal situação, inicialmente, cria-se variáveis para que as seguintes situações:

1. Se há um elemento que pode ser alterado sem seu controle;
2. Quando é um elemento muito grande (e.g. links);
3. Quando o elemento é utilizado muitas vezes.

Para o nosso caso teste, utilizaremos as seguintes variáveis em nosso novo *script* ([pratica2.sh][2]):

> **Nota:** relembrar das definições e condições de variáveis apresentadas na [seção 2.1](#21-variáveis).

```shell
# PPA
PPA_PIPER_LIBRATBAG="ppa:libratbag-piper/piper-libratbag-git"
PPA_LUTRIS="ppa:lutris-team/lutris"

# URL
URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_SIMPLE_NOTE="https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"

# DIRECTORIES
DIR_DOWNLOAD_SOFTWARES="$HOME/Downloads/softwares"
```

Tendo declarado essas variáveis globais (*uppercase*), chamar no script da seguinte forma: `$PPA_LUTRIS` ou `"$PPA_LUTRIS"` (para manter a mesma formatação).

#### 3.4.2. Adicionar funções - [pratica3.sh][3]

A segunda parte do aperfeiçoamento do programa, se dá pela formulação das funções existentes no código. Para isso, passar um pente fino em cada etapa do seu comando inicial e definir o que está sendo feito em cada linha de comando. Feito isso, adicionar funções que definem essas atividades. No caso deste documento:

```shell
remove_locks () {
}

add_architecture_i386 () {
}

update_repos () {
}

add_ppas () {
}

install_deb_pkgs () {
}

install_apt_pkgs () {
}

install_snap_pkgs () {
}

upgrade_and_clean_system () {
}
```

Para cada função, adicionar os respectivos comandos iniciais (vide [pratica3.sh][3]).

Além de apenas dividir o código em funções, é necessário chamar as funções criadas dentro do Script. Por isso, no final do *script*, adicionar uma parte para Debug e chamar cada uma delas.

```shell
remove_locks
add_architecture_i386
add_ppas
update_repos
install_deb_pkgs
install_apt_pkgs
install_snap_pkgs
upgrade_and_clean_system
```

#### 3.4.3. Exit codes

Todos os comandos Linux ou Unix executados por um *shell script* ou usuário têm uma saída de status, que são números inteiros. A saída 0 significa que o comando foi executado com sucesso. Já um número diferente de zero (1-255), remete ao status de falha de um comando.

Para descobrir qual a o código de saída (*exit code*) de um comando, utilizar uma variável particular para este caso: `$?`, que retornará o exit code do último comando dado. Observe o exemplo abaixo:

```bash
$ date
> Thu Mar 3 09:04:13 -03 2022
$ echo $?
> 0
```

> **Nota:** o *exit code* também pode ser obtido por um comando `printf`: `printf '%d\n' $?`.

Sabendo disso, fica mais fácil imaginar como manusear os resultados de funções dentro de condicionais, laços, funções etc. em um *shell script*: com os *exit codes*. Em suma, é possível colocar o comando `exit [0-255]` no retorno de uma função para que seja salvo na variável `$?`.

A tabela abaixo apresenta os exit codes recomendados para o seu *shell script*:

| Exit status | Descrição                                                               |
| :---------- | :---------------------------------------------------------------------- |
| `1`         | Saída para erros gerais                                                 |
| `2`         | Uso indevido de builtin do shell (de acordo com a documentação do Bash) |
| `126`       | O comando requisitado não pode ser executado                            |
| `127`       | Comando não encontrado                                                  |
| `128`       | Argumento inválido para o comando de saída                              |
| `128+n`     | Sinal de erro fatal "n"                                                 |
| `130`       | Script Bash encerrado por **Ctrl+C**                                    |
| `255*`      | Status de saída fora do range                                           |

> **Dica:** os *exit codes* são extremamente importantes para manusear os dados e funções dentro de condicionais.

#### 3.4.4. Aplicar condicionais - [pratica4.sh][4]

A primeira implementação de condicionais no nosso *script* de prática ([pratica4.sh][4]) será dentro da função `install_deb_pkgs`, visto que há o comando `mkdir` criando sempre a pasta `"$DIR_DOWNLOAD_SOFTWARES"`, mesmo sem conferir se já existe o diretório.

Assim, segue o código aplicado:

```shell
if [[ ! -d "$DIR_DOWNLOAD_SOFTWARES" ]]; then # Testa: caso o diretório ... não exista, então
  mkdir "$DIR_DOWNLOAD_SOFTWARES"
else
  echo "Esse diretório já existe!"
fi
```

> **Nota:** vale ressaltar os comandos `&&` e `||` que podem ser utilizados dentro de condicionais. `&&` passa quando o comando anterior for verdadeiro (*exit code* = 0) e `||` quando o primeiro for falso (*exit code* > 0)

Neste caso, incorporando os operadores `&&` (*and*) e `||` (*or*) dentro da mesma função, teria:

```shell
[[ ! -d "$DIR_DOWNLOAD_SOFTWARES" ]] && mkdir "$DIR_DOWNLOAD_SOFTWARES"
```

Note que este método impossibilita a utilização de um `else`na função. Em contrapartida, duas linhas são "economizadas" da memória. Por isso é recomendado essa utilização sempre que possível, quando não for preciso utilizar o `else`.

#### 3.4.5. Lista de pacotes - [pratica5.sh][5]

As funções responsáveis pela instalação dos pacotes apresenta comandos repetitivos e que não são tratados, como no exemplo desta prática ([pratica5.sh][5]). Quatro pacotes são instalados em comandos diferentes e não é verificado se estes já estão instalados, gastando tempo de execução.

Para tal validação, as seguintes listas foram criadas:

```shell
SOFTWARES_TO_INSTALL_APT={
  snapd
  winff
  guvcview
  virtualbox
}
```

> **Nota:** sempre que houver comandos repetitivos que alteram alguns argumentos, é recomendado atribuir todos em uma lista. Essas listas devem separar os atributos por espaço (nas boas práticas, utiliza-se a quebra de linha).

Para a instalação destes pacotes dentro da lista, acrescentar um laço que instale cada um:

```shell
for software in ${SOFTWARES_TO_INSTALL_APT[@]}; do
  sudo apt install $software -y
done
```

> **Nota:** a nomenclatura utilizada pelo *shell script* para trazer todos os itens da lista é [@].

Feito isso, teremos uma automação do processo de instalação dos pacotes **apt**, mas ainda não acontece uma validação para saber se esses pacotes já estão instalados na máquina. Dessa forma, essa validação pode ser feita utilizando juntos os comandos: `dpkg`e `grep`. Adicionalmente, utiliza-se a opção `-q` (quiet) para que nada seja mostrado na tela:

```shell
for software in ${SOFTWARES_TO_INSTALL_APT[@]}; do
  if ! dpkg -l | grep -q $software; then
    sudo apt install $software -y;
  else
    echo "[INFO] - O pacote $software já está instalado.";
done
```

Note que a sintaxe do `if` mudou para esta situação, ao retirar os colchetes utilizados para o teste de diretório, pois para testar comando, a condicional precisa necessariamente ler a saída direta do comando, e não o *exit code*.

Dessa forma, realizar as mesmas etapas anteriores para cada parte do código que apresentar recorrência. Neste caso, criar listas e validações para as funções `install_snap_pkgs` (utilizando o comando `snap list | grep $software`)

>**Nota:** se atente aos comandos utilizados para cada situação e gerenciador de pacotes, pois neste caso, será diferente a validação dos pacotes **apt** e **snap**.

#### 3.4.6. Parsing de URL - [pratica6.sh][6]

A função exemplo a ser aprimorada nesta etapa é a `download_deb_pkgs`. Percebe-se que não há uma validação nesta função ao baixar os pacotes **.deb**,, pois não há uma verificação se estes pacotes já estão lá. Entretanto, o próprio comando `wget` já apresenta uma opção que realiza esta validação: `-c`.

Da maneira como foi programado até agora, está sendo instalado algumas variáveis específicas. Imagina em uma situação real, que há diversos pacotes .deb a serem baixados e de URLs distintas, sendo necessário uma criação de uma nova lista. Logo, realocar as URLs das variáveis `URL_GOOGLE_CHROME` e `URL_SIMPLE_NOTE`:

```shell
SOFTWARES_TO_INSTALL_DEB=(
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb # Google Chrome
    https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb # Simple Note
)
```

O tratamento desta lista pode ser feito com os seguintes comandos:

```shell
for url in %{SOFTWARES_TO_INSTALL_DEB[@]}; do
  wget -c $url -P "$DIR_DOWNLOAD_SOFTWARES"
done
```

Mesmo com esse tratamento feito, há um problema neste código: não se tem o nome do pacote que está sendo instalado, apenas uma URL. Portanto, não é possível realizar um `grep` para verificar se já está instalado.

Um *workaround* encontrado para essa situação, é pegar o tratar a URL para pegar uma palavra chave. Por exemplo, na seguinte URL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb, o nome **google** deve ser extraído. Para isso, utilizaremos uma expansão de parâmetros (do inglês *shell parameter expansion*), que possibilita a retirada deste termo. Para maiores informações, verificar a documentação do [Shell Variable Expansion][7].

A primeira expansão utilizada será `${parameter##word}`, que retorna tudo depois da `word` do `parameter`. Exemplo:

```shell
$ URL="https://github.com/Automattic/simplenote-electron/releases/download/v1.8.0/Simplenote-linux-1.8.0-amd64.deb"
$ echo ${URL##*/} # Retorna tudo que vem depois do último /
> Simplenote-linux-1.8.0-amd64.deb
```

> **Nota:** não é possível utilizar mais de um *variable expansion* na mesma função, obrigando assim, a trabalhar com a saída do anterior.

Com esse dado na mão, deve-se aplicar agora uma substituição de `-` por `_` utilizando o comando `sed`, afim de padronizar os resultados:

```shell
$ echo ${URL##*/} | sed 's/-/_/g'
> Simplenote_linux_1.8.0_amd64.deb
```

Por fim, cortar a string anterior para tudo o que vier antes do `_`, com o comando `cut`:

```shell
$ echo ${URL##*/} | sed 's/-/_/g' | cut -d _ -f 1
> Simplenote
```

As opções `-d` e `-f` do `cut` equivalem, respectivamente, ao delimitador (_) e à coluna (1).

Retornando ao exemplo prático do documento ([pratica6.sh][6]), utilizar o seguinte comando dentro do for da função `download_deb_pkg`:

```shell
for url in %{SOFTWARES_TO_INSTALL_DEB[@]}; do
  url_extract=$(echo ${url##*/} | sed 's/-/_/g' | cut -d _ -f 1)
  wget -c $url -P "$DIR_DOWNLOAD_SOFTWARES"
done
```

Além da extração de atributo do URL, é necessário tratar os estes dados para a instalação, resultando em um código final:

```shell
download_and_install_deb_pkgs () {
    [[ ! -d "$DIRETORIO_DOWNLOAD_PROGRAMAS" ]] && mkdir "$DIRETORIO_DOWNLOAD_PROGRAMAS"
    for url in %{SOFTWARES_TO_INSTALL_DEB[@]}; do
        extract_url=$(echo ${url##*/} | sed 's/-/_/g' | cut -d _ -f 1)
        if ! dpkg -l | grep -iq $extract_url; then
            wget -c "$url" -P "$DIR_DOWNLOAD_SOFTWARES"
            sudo dpkg -i $DIR_DOWNLOAD_SOFTWARES/${url##*/}
        else 
            echo "[INFO] O programa $extract_url já está instalado"
        fi
    done
    sudo apt -f install -y
}
```

Pode ser que exista alguma URL que não entre no tratamento de dados realizados acima. Para esses casos, será desenvolvida uma nova forma de tratamento.

#### 3.4.7. Teste de requisitos - [pratica7.sh][8]

Neste ponto, já possuímos um *script* quase todo automatizado. Entretanto, sempre lembre de ler novamente o seu *script* e verificar se existe alguma dependência externa, realizando a seguinte pergunta:

* Se rodar esse *script* no meu Linux zerado, ele vai conseguir rodar 100%?

No nosso caso atual de estudo ([pratica7.sh][8]), não será possível realizar a execução, pois são utilizados os pacotes `wget` e `snap`, que não vêm instalados por *default* na maioria dos sistemas. Por outro lado, há o dpkg. Outro requisito é a configuração prévia de conexão com a internet para que estes gerenciadores de pacotes executem seus comandos com sucesso.

Por esse e outros motivos, é necessária esta etapa de teste de requisitos, para certificar-se que tudo ocorrerá normalmente. Para isso, seguir os passos para realizar as validações da nossa prática:

1. Validação do `wget`:
   * verificar se o pacote já está instalado, utilizando `which`:

```shell
if [[ ! -x `which wget` ]]; then
    echo "[INFO] - O programa wget não está instalado."
    echo "[INFO] - Instalando wget..."
    sudo apt install wget -y
else
    echo "[INFO] - O programa wget já está instalado."
fi
```

2. Validação do `snap`:
   * verificar se o pacote já está instalado, utilizando `which`:

```shell
if [[ ! -x `which snap` ]]; then
    echo "[INFO] - O programa snap não está instalado."
    echo "[INFO] - Instalando snap..."
    sudo apt install snap -y
else
    echo "[INFO] - O programa snap já está instalado."
fi
```

3. Validação da conexão com a internet:
   * realizar validação com o ping e redirecionador de comando:

```shell
if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo "[ERROR] - Seu computador não tem conexão com a Internet. Verifique os cabos e o modem."
  exit 1
else
  echo "[INFO] - Conexão com a Internet funcionando normalmente."
fi
```

> **Nota:** a opção `-c` para alguns comandos (como o `ping`) é um limitador de resposta, passando o tanto de vezes que o comando deve ser executado.

>  **Nota:** no código acima, é utilizado um redirecionador de comandos `&> /dev/null` que será tratado nas próximas seções.

#### 3.4.8. Redirecionamento de comandos

É possível usar operadores de redirecionamento para redirecionar fluxos de entrada e saída de comandos dos locais padrão para locais diferentes. O local do fluxo de entrada ou saída é conhecido como **identificador**.

A tabela a seguir lista operadores que você pode usar para redirecionar fluxos de entrada e saída de comandos.

| Operador de redirecionamento | Descrição                                                                                                                    |
| :--------------------------- | :--------------------------------------------------------------------------------------------------------------------------- |
| `>`                          | Grava a saída do comando em um arquivo ou dispositivo, como uma impressora, em vez de gravar na janela do prompt de comando. |
| `<`                          | Lê a entrada do comando a partir de um arquivo, em vez de ler a partir do teclado.                                           |
| `>>`                         | Acrescenta a saída do comando ao final de um arquivo, sem excluir as informações já existentes no arquivo.                   |
| `>&`                         | Grava a saída de um identificador na entrada de outro identificador.                                                         |
| `<&`                         | Lê a entrada de um identificador e grava essa entrada na saída de outro identificador.                                       |
| <code>&#124;</code>          | Le a saída de um comando e grava essa saída na entrada de outro comando. Também conhecido como *pipe*.                       |

Por padrão, a entrada do comando (isto é, o identificador `STDIN`) é enviada do teclado para o **Cmd.exe**; em seguida, esse arquivo envia a saída do comando (isto é, o identificador `STDOUT`) para a janela do prompt de comando.

A tabela a seguir lista os identificadores disponíveis.

| Identificador | Equivalente numérico do identificador | Descrição                                                                                                 |
| :------------ | :-----------------------------------: | :-------------------------------------------------------------------------------------------------------- |
| `STDIN`       |                   0                   | Entrada do teclado (linha de comando).                                                                    |
| `STDOUT`      |                   1                   | Saída para a janela do prompt de comando.                                                                 |
| `STDERR`      |                   2                   | Saída de erro para a janela do prompt de comando.                                                         |
| `UNDEFINED`   |                  3-9                  | Estes identificadores são definidos individualmente pelo aplicativo e são específicos de cada ferramenta. |

Exemplo:

```bash
$ apt update 2> saida_error
> Lendo listas de pacotes... Pronto
$ cat saida_error
> E: Não foi possível abrir arquivo de trava /var/... (13: Permissão negada)
> ...
```

Ou, trabalhando no exemplo acima, pode-se direcionar um comando para dois+ lugares diferentes, como visto na continuação do exemplo acima:

```bash
$ apt update 1> saida_error 2>&1 # Manda o STDOUT para o saida_error e o STDERR para o mesmo lugar do STDOUT
$ cat saida_error
> Lendo listas de pacotes... Pronto
> E: Não foi possível abrir arquivo de trava /var/... (13: Permissão negada)
> ...
```

Para mais informações sobre o redirecionamento de comandos, verificar o manual do bash (`man bash`).

> **Nota:** o local `/dev/null` é um dispositivo nativo de todas as distribuições Linux e funciona como um "buraco negro do Linux", ou seja, não serve para exatamente nada (como se fosse uma lixeira que tritura todos enviados para lá).

#### 3.4.9. Tratando as saída do script - [pratica8.sh][9]

O *script* no estado atual ([pratica7.sh][8]), ao ser executado, está mostrando muita resposta na tela do prompt de comando, podendo em alguns casos ser até prejudicial para o desempenho. Assim, é necessário reduzir as mensagens desnecessárias que são mostradas, com o auxílio dos redirecionadores de comandos, apresentados na seção anterior.

1. Adicionar mensagens em cada processo:

```shell
remove_locks () {
    echo "[INFO] - Removendo locks..."
    [...]
}

add_architecture_i386 () {
    echo "[INFO] - Adicionando arquitetura i386..."
    [...]
}

update_repos () {
    echo "[INFO] - Atualizando repositórios..."
    [...]
}

add_ppas () {
    echo "[INFO] - Adicionando PPAs..."
    [...]
}

download_and_install_deb_pkgs () {
    [...]
        if ! dpkg -l | grep -iq $extract_url; then
            echo "[INFO] - Baixando o arquivo $extract_url..."
            wget -c "$url" -P "$DIR_DOWNLOAD_SOFTWARES"
            echo "[INFO] - Instalando o $extract_url..."
            sudo dpkg -i $DIR_DOWNLOAD_SOFTWARES/${url##*/}
            echo "[INFO] - Instalando dependências..."
        [...]
}

install_apt_pkgs () {
    for software in ${SOFTWARES_TO_INSTALL_APT[@]};
        if ! dpkg -l | grep -q $software; then
            echo "[INFO] - Instalando o $software..."
            sudo apt install $software -y;
        else
            echo "[INFO] - O pacote $software já está instalado.";
    done
}

install_snap_pkgs () {
    for software in ${SOFTWARES_TO_INSTALL_SNAP[@]};
        if ! snap list | grep -q $software; then
            echo "[INFO] - Instalando o $software..."
            sudo snap install $software;
        else
            echo "[INFO] - O pacote $software já está instalado.";
    done
}

upgrade_and_clean_system () {
    echo "[INFO] - Fazendo upgrade e limpeza do sistema..."
    sudo apt dist-upgrade -y
    sudo apt autoclean
    sudo apt autoremove -y
}
```

Feito isso e executado o *script*, percebe-se que ainda está muito poluído: muitas informações aparecendo rapidamente na tela do terminal, misturando as informações inseridas, com as saídas padrão.

Para resolver isso, deve se utilizar o redirecionamento de comando para o `/dev/null`. Entretanto, se implementá-lo de forma indevida, ao debugar o código e falhar, não será possível notar esta falha, por falta de informação. Sendo assim, é extremamente importante tratar e identificar todas as condições de erro (jogando-as em logs de debug).

1. Enviar todas as saídas do código para o `/dev/null`:

```shell
sudo apt install wget -y &> /dev/null
[...]
sudo apt dist-upgrade -y &> /dev/null
sudo apt autoclean &> /dev/null
sudo apt autoremove -y &> /dev/null
```

> **Nota:** apesar de parecer uma boa ideia retirar todas as informações de debug do *script*, sempre deve-se perguntar qual o público final para aquele. Caso sejam usuários mais avançados, é válido deixar as informações aparentes para que haja maior controle.

#### 3.4.10. Colorindo o script - [prática9][10]

As cores em um código bash são chamadas de *escape corrector* ou *escape sequences* (sendo *escape* relacionado com a tecla `ESC`), que é uma combinação de caracteres que tem um outro significado do que aqueles digitados. Para maiores informações, verificar documentação [bash:tip_colors_and_formatting][11]

No bash, o caractere <kbd>Esc</kbd> pode ser obtido com as seguintes sintaxes:

- `\e`
- `\033`
- `\x1B`

Exemplos:

```shell
echo -e "\e[31mHello World\e[0m" # Vermelho
echo -e "\033[31mHello\e[0m World"
```

Assim sendo, para personalizar o nosso *script* de prática ([prática9][10]), utilizaremos essa formatação por *escape sequences* criando variáveis de cores (para seguir as melhores práticas).

> **Nota:** sempre que utilizar desta formatação, acrescentar o parâmetro `-e` no comando `echo`.

As cores criadas para o *script* são:

```shell
RED="\e[1;91m"
GREEN="\e[1;92m"
BLUE="\e[1;94m"
NO_COLOR="\e[0m"
```

É muito importante criar uma variável para zerar a formatação anterior, neste caso a variável `NO_COLOR`, para que a cor fique apenas no echo que queremos. Caso não queira criar a variável, utilizar apenas o comando `\e[0m`.

> **Nota:** para adicionar mais de uma formatação, utilizar o seguinte padrão: \e[<c1>;<c2>;...;<cN>m (IDs de formatação separados por ponto e vírgula).

A aplicação destas cores no código será da seguinte forma:

```shell
# INTERNET TEST
[...]
echo -e "[ ${RED}FAIL${NO_COLOR} ] - Seu computador não tem conexão com a Internet. Verifique os adaptadores de rede, os cabos e o modem."
[...]
echo -e "[ ${BLUE}INFO${NO_COLOR} ] - Conexão com a Internet funcionando normalmente."
[...]
echo -e "[  ${GREEN}OK${NO_COLOR}  ] - Instalando wget..."
[...]
```

#### 3.4.11. Organização do código

Na busca de qualidade do *script*, é imprescindível a adoção de boas práticas. Algumas delas ajudam a manter o código mais legível, fácil de compreender e de manter. Lembre-se, para alcançarmos um bom código, não basta apenas que ele funcione.

Pensando nisso, e visto todo o trabalho feito com o *script* de prática, foi separado em tópicos o que é necessário para o seu *script* estar dentro dos padrões de boas práticas.

1. Estrutura:
   - deixa o código muito mais legível, limpo e esteticamente mais bonito;
   - Variáveis > Listas > Testes > Funções > Execução
2. Comentários e documentação:
   - explicar o algoritmo ou a lógica usada, mostrando o objetivo de uma variável, método, classe...
   - documentar o projeto, descrevendo a especificação do código. Desta maneira, qualquer pessoa poderá analisar um arquivo de documentação, mesmo que este não apresente o código fonte.
3. Convenções de nomes:
   - variáveis: globais com letras maiúsculas e locais com minúsculas;
   - funções: precisa de fato descrever o funcionamento do programa como um todo, como “CalculaRaizQuadrada” ou “calcula_raiz_quadrada”.
4. Forma reduzida
   - optar sempre pela forma reduzida de validações `if` quando possível (geralmente, sempre quando não existir um `else` para aquela condição). Pode-se utilizar o `&&` para condições positivas e `||` para condições negativas.
5. Outras boas práticas em diversas linguagens de programação:
   - Endentação;
   - Utilização de pacotes;
   - Tratamento de erros;
   - Padrões de projeto;
   - Deprecation;
   - Testar e depurar;
   - Versionamento;
   - Tamanho.

Outra dica muito importante é sempre colocar o seu header no início dos seus *scripts*, para que, lendo o header, o usuário entenda qual o objetivo, como funciona, onde foi testado, qual o histórico, quem é o desenvolvedor, mantenedor, o contato para relatar algum bug, entre outras informações.

```shell
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# UbuntuSetup.sh - post installations of Ubuntu 20.04.
# 
# DESCRIPTION
#    This is a script to configure and prepare your Ubuntu
#    environment
#
# IMPLEMENTATION
#    version         1.0.0
#    author          Jonathan T. Silva
#    license         MIT License
#    script_id       0
# 
# CHANGELOG
#    v 1.0.0 : 2022/03/08 : JonathanTSilva
#        - Script creation
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva
```

Um exemplo de comentário em bloco utilizado nos meus *scripts*:

```shell
#------------------------------------------------------------
# The ${extract_url} variable keeps the software name that 
# must be installed doing the URL parsing that is in the 
# ${SOFTWARES_TO_INSTALL_DEB}. Performs the following actions:
# 1. Keep all contents after the last URL bar (/ - bash variable expansion);
# 2. Change '-' for '_';
# 3. Take only the first column using '_' as separator.
#------------------------------------------------------------
```

> **Nota:** nesta última prática, o *shebang* foi alterado de `#!/bin/bash` para `#!/usr/bin/env bash`. Essa segunda opção é diferente da outra por ser mais portável, visto que é buscado nas variáveis de ambiente (env) a variável bash, por todos os diretórios.

> **Dica:** neste script final foi alterado uma pedaço de código dentro do if que estava dentro de `` acentos de crase. Pode ser utilizado dessa forma, mas a maneira correta é estes códigos dentro de ${}.

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 4. Avançado

### 4.1. Configurando parâmetros

<!-- VOLTAR AO INÍCIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 5. Exercícios

### 5.1. Obter informações do computador

- Entrada de dados: `uname -a`;
- Objetivo: remover informações do computador: nome, kernel e arquitetura;
- Adicional: um dado em cada linha.

```bash
$ uname -a
> Linux EST1440 5.10.16.3-microsoft-standard-WSL2 \#1 SMP Fri Apr 2 22:23:49 UTC 2021 x86_64 GNU/Linux
$ uname -a | cut -d" " -f2,3,12 | tr " " "\n"
```

### 5.2. Obter o IP local

- Entrada de dados: `ifconfig` (necessário pacote **net-tools**);
- Objetivo: identificar meu IP local;
- Adicional: N/A.

```bash
$ ifconfig
> eth0: flags=6322...
        inet 192.168.90.90 ...
$ ifconfig | grep "inet" | grep "broadcast" | cut -d" " -f10
```

### 5.3. Obter a memória

- Entrada de dados: `cat /proc/meminfo`;
- Objetivo: conseguir a memória total e memória livre;
- Adicional: subtrair para obter a memória em uso.

```bash
$ cat /proc/meminfo | grep "Mem" | head -n 2 | cut -d":" -f2 | tr -d "[a-zA-Z]" | tr -d " " | tr "\n" "-" | cut -d"-" -f1-2 | bc
```

### 5.4. Obter nomes e endereços de memória

- Entrada de dados: `cat /proc/modules`;
- Objetivo: obter nomes e endereços de memória;
- Adicional: lista de nomes, seguida da lista de endereços de baixo para cima.

```bash
$ a="$(cat /proc/modules | cut -d" " -f1,6)"; 
echo $a | tr " " "\n" | grep -v "0xff"; 
echo $a | tr " " "\n" | grep "0xff" | tac 
```

> **Nota:** `tac` é o comando `cat` ao contrário, e seu uso é justamente esse: inverter a saída do `cat`.

### 5.5. Obter portas e serviços

- Entrada de dados: `nmap -sS -sV -F scanme.nmap.org`;
- Objetivo: conseguir todas as portas e serviços utilizados pelo alvo scanme.nmap.org (site criado justamente para esse teste do `nmap`);
- Adicional: N/A.

```bash
$ a="$(nmap -sS -sV -F scanme.nmap.org | grep "open" | tr "\n" ":" | xargs)";
echo $a | tr ":" "\n" | cut -d"/" -f1 > t1;
echo $a | tr ":" "\n" | cut -d"/" -f2 | cut -d " " -f4-99 > t2;
paste t1 t2 | tr "\t" " ";
rm t1 t2
```

> **Nota:** `nmap` é um mapeador de rede muito utilizado pelos administradores para mapear suas redes.

> **Nota:** `xargs` neste comando, está fazendo um papel de limpador de código, ao retirar todos os espaços vazios da saída.

### 5.6. Criptografia de *string*

#### 5.6.1. Criptografar uma *string*

- Entrada de dados: `./criptoString.sh`;
- Objetivo: criptografar uma string utilizando shell script;
- Adicional: Criptografar substituindo todas as letras do alfabeto e posteriormente reforçando-a.

**Resolução:**

1. Primeira estruturação a ser feita, é passar o dado para o shell script;
2. Para o usuário que não passar nenhum parâmetro ao iniciar o script, deve haver uma condição de contorno;
3. Como primeira ação criptográfica, trocar todas as letras do alfabeto (`$p1`);
4. Retirar os espaços da frase e substituir por ":" (`$p2`);
5. Remover a quebra de linha e substituir por "@" (`$p3`);
6. Separar com espaço todos os caracteres, e;
7. Trocar todos os caracteres pelo seu equivalente numérico (`retorna_numero()` e (`$p4`));
8. Entretanto, antes foi trocado o último caractere por um arroba, e ele não conta como um número. Assim, é preciso tratar todos os caracteres para ver se é ou não uma letra;
9. Nesta etapa, já temos uma criptografia válida, mas ainda é fácil de entender. Para aumentar o nível, vamos multiplicar o número de cada letra, pela sua respectiva posição na string criptografada. Por exemplo: a string original "apenas uma frase de teste" deve estar criptografada da seguinte forma "26 11 22 13 26 8 : 6 14 26 : 21 9 26 8 22 : 23 22 : 7 22 8 7 22 @". Nessa próxima fase, devemos ter uma criptografia na qual 26x1 11x2 22x3 13x4... (`$p5`);
10. Colocar letras aleatórias no espaço entre os dados. Para isso, utilizar a variável `$RANDOM` para que sejam jogados números aleatórios. Há um porém: a resposta de `$RANDOM` pode ser 0, devendo assim, contornar a possibilidade com `$(( ($RANDOM%25)+1 ))`.

```shell
#!/usr/bin/env bash

# ----- 07 -----
retorna_numero() { echo "a b c d e f g h i j k l m n o p q r s t u v w x y z" | cut -d"$1" -f1 | tr " " "\n" | wc -l; }
# ----- 10 -----
random_letter() { echo "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" | cut -d" " -f$(( ($RANDOM%25)+1 )); }

# ----- 02 -----
if [ "$1" == "" ]; then exit; fi

# ----- 01 -----
IN=$1
echo "String original: $IN"
echo

# ----- 03 -----
p1="$(echo $IN | tr "abcdefghijklmnopqrstuvwxyz" "zyxwvutsrqponmlkjihgfedcba")"

# ----- 04 -----
p2="$(echo $p1 | tr " " ":")"

# ----- 05 -----
p3="$(echo $p2 | tr "\n" "@")"

# ----- 06 -----
p4="$(for a in $(seq $(echo -n "$p3" | wc -c)); do 
  local carac="$(echo "$p3" | cut -b $a;)" 

  # ----- 08 -----  
  local isLetter="$(echo $carac | grep "[a-zA-Z]")"
  if [ "$isLetter" != "" ]; then
    # ----- 07 -----
    retorna_numero $carac
  else
    echo "$carac"
  fi

done | tr "\n" " ")"

# ----- 09 -----
p5="$(for a in $p4; do
  isNumber="$(echo $a | grep "[1-9]")"
  if [ "$isNumber" != "" ]; then
    let count++
    echo -n $(($count * $a))$(random_letter)
  else
    echo -n "$a$(random_letter)"
  fi
done)"

echo $p5
```

Em suma:

- Passo 1 (`$p1`): substituição alfabética
  - a - z
  - b - y
  - ...
- Passo 2 (`$p2`): substituir os espaços adicionais e quebra de linha por ":" e "@", respectivamente
  - abc def ghi
  - abc:def:ghi@
  - ...
- Passo 3 (`$p3`): substituição pelo valor numérico
  - a - 1
  - b - 2
  - ...
- Passo 4 (`$p4`): multiplicar cada caractere numérico pela sua posição
  - a - 26 * 1
  - b - 11 * 2
  - ...
- Passo 5 (`$p5`): substituir os espaços por letras aleatórias
  - 26 11
  - 26H11

> **Nota:** um truque que pode ser feito é rodar o resultado final mais uma vez no script, para que seja criptografado duas vezes, e posteriormente, descriptografar duas vezes.

#### 5.6.2. Descriptografar uma *string*

### 5.7. Quebrar senhas

- Entrada de dados: `./brokeScript.sh <wordlist.txt>`;
- Objetivo: quebrar senhas criptografadas utilizando *wordlist*;
- Adicional: N/A.

No Kali Linux há algumas *wordlists* prontas para realizar uma quebra de senhas. Ficam dentro de `/usr/share/wordlists/` e são divididas em alguns diretórios. Neste exercício utilizaremos a lista `common.txt` da pasta `fern-wifi` (muito utilizada para quebrar senhas de redes sem fio) - não é uma *wordlist* potente/muito grande, mas suficiente para o testar os conceitos.

O princípio geralmente utilizado para quebrar *hashs*, é armazenar uma lista de palavras no arquivo da *wordlist* e criar um script que vai interpretando palavra por palavra e *encryptando* (na ordem), comparando com a *hash* que ela fornece. Entretanto, apesar de ser um método bem eficiente, utiliza muito recurso do computador (gerando muito desperdício de resposta e tempo). Uma maneira mais eficiente é *encryptar* as palavras, salvar no arquivo de *wordlist* e na frente da palavra, a *hash* correspondente, pois é muito mais fácil utilizar o grep do que realizar o método anterior (cerca de 2mi de operações)

Utilizaremos alguns algoritmos prontos para *encryptar* nossas palavras:
- md5sum;
- sha256sum;
- base64;

```shell
#!/usr/bin/env/ bash

if [ "$1" == "" ]; then 
  echo
  echo "Uso: $0 wordlist.txt"
  exit; 
fi

dos2unix $1 >> /dev/null

for word in $(cat $1); do
  md5="$(echo -n "$word" | md5sum | cut -d" " -f1)"
  b64="$(echo -n "$word" | base64)"
  sha256="$(echo -n "$word" | sha256sum | cut -d" " -f1)"
  echo "$word:$md5:$b64:$sha256"
done | temp$1

cat tem$1 | column -s: -t >> "$1.final"
rm temp$1
```

> **Nota:** para alguns arquivos de wordlist criados no windows, o padrão de término e quebra de linha muda, como é o caso do utilizado (`common.txt`). Ao executar o comando `file common.txt` é possível observar a resposta: `common.txt: ASCII text, with CRLF line terminator` (padrão utilizado pelo Windows que termina e quebra a linha com `\r\n`). Para isso, tratar essa condição com o comando `tr` ou o comando `dos2unix` (próprio para essas situações).

A sua utilização de dá pelo comando `grep`. Vamos supor que você encontre uma *hash* em um banco de dados e queira descobrir qual é a string para ela (caso já exista em seu banco/*wordlist*). Utilize:

```bash
$ grep "HASH" <script.txt>
> <palavra> <md5sum> <base64> <sha256sum>
```

### 5.8. Mapear rede interna

- Entrada de dados: ``;
- Objetivo: mapear a rede interna, descobrindo computadores onlines na rede, portas, etc.;
- Adicional: N/A.

```shell
#!/usr/bin/env/ bash

mynet="$(nmap -sN -p 21,22,80 $(echo "$(ifconfig | grep "inet" | grep "broadcast" | cut -d" " -f10 | cut -d"." -f1-3).0/24") | grep "report for" | cut -d" " -f5 )"

for ip in $(mynet); do
  nmap -sS -F -O %ip > temp

  ports="$(cat temp | grep "/tcp" | cut -d"/" -f1 | tr "\n" " ")"
  if [ "$ports" ==  ""]; then ports="N/A"; fi

  os="$(cat temp | grep "OS details" | cut -d":" -f2 | cut -d" " -f2-99 | cut -d"," -f1 | grep -v "many fingerprints")"
  if [ "$os" ==  ""]; then os="N/A"; fi

  echo "IP Ativo: $ip | Portas: $ports | Sistema Operacional: $os"
done
```

### 5.9. Requisitar informações WEB

- Entrada de dados: `./script.sh "string"`;
- Objetivo: monitorar o pastebin.com e obter o link das postagens com algum conteúdo específico;
- Adicional: demonstrar pré-procedimento de criação do script.

**Resolução:**

1. Acessar o pastebin.com (com o `curl` ou `get`. `Curl` não se passa por um navegador como o `get`, podendo não exibir algumas informações bloqueadas por sites. Por outro lado, o `curl` tem uma opção para isso, tornando a escolha mais poderosa);
2. Extrair os links das novas postagens:
   - Problema: dependendo da frequência, isso pode extrair o mesmo link duas vezes. Assim, filtrar para não repetir os links;
3. Acessar cada um dos links e obter conteúdo;
4. Filtrar o conteúdo de interesse;
5. Exibir o link (ou não)/salvar o link.

```shell
#!/usr/bin/env bash

rm templinks templinks2 2> /dev/null > /dev/null
touch templinks
touch templinks2

# Extract site links | templinks
extract() {
  links="$(curl -s "http://pastbin.com/archive" | grep "i_p0" | cut -d"=" -f5 | cut -d'"' | tr -d "/")"
  sleep2 # Required time to don't be blocked for pastebin.com
  for l in links; do
    res1="$(grep "$l" templinks)"
    if ( "$res1" == "" ); then echo $l >> templinks; fi
  done
}

# Access the links and filter which have the word "public" | templinks2
access() {
  for r in $1; do
    echo "$r" >> templinks2
    res2="$(curl -s "http://pastebin.com/raw/$r" | grep $2)"; 
    if [ "$res2" != "" ]: then 
      echo "http://pastebin.com/raw/$r"; 
    fi
  done
}

[ "$1" == "" ] && { clear; echo "[+] Use: $0 \"string\""; exit; }
clear
echo "[+] Monitoring \"$1\" on pastebin.com"
echo
while :; do
  extract
  links="$(diff templinks templinks2 | cut -d" " -f2 | grep -v ",")"
  access "$links" "$1"
  sleep 3
done
```

### 5.10. Proteger de ataques *defacement* (*deface*)

- Entrada de dados: `bash`;
- Objetivo: Se proteger de um ataque *deface*, que altera as informações da página principal de sua aplicação (`index.html`);
- Adicional: Loop infinito para verificar se o arquivo foi deletado ou modificado, gerando uma hash **md5**. Executar o script como **root**.

```shell
#!/usr/bin/env/ bash

ho="$(md5sum index.html | cut -d" " -f1)"; 
mkdir ~/backup/; cp index.html ~/backup/i.html; clear; 
while :; do
  ha="$(md5sum index.html 2> /dev/null | cut -d" " -f1)";
  echo $ha
  sleep 0.3
  if [ "$ha" != "$ho" ]; then
    echo "[+] Recovering original file";
    cp ~/backup/i.html ./index.html;
  fi
done & # Foreground execution
```

Para executar o script como um **daemon** (serviço de sistema), execute o script com o caractere `&` no final, no mesmo shell, será retornado o ID do script. Copie este ID, e cole na frente do comando `disown`: `disown 18264`. Após isso, só fechar as shells abertas.

### 5.11. Proteger de invasor de porta

- Entrada de dados: ``;
- Objetivo: Se proteger de um ataque com `nmap` para ler alguma porta aberta;
- Adicional: N/A.

**Terminal 1 - attacker**

```bash
$ nmap -sS IP
> # Can listen all ports in your IP
$ nmap -sS -sV IP
> # Listen and see the services version
```

**Terminal 2 - defender**

```bash
$ while :; do cat /dev/urandom | nc -lvp 22; done
> listening on [any] 22 ...
# OR
$ for a in $(seq 30); do nc -lvp $a & done
# OR
$ while :; do nc -lkvvp 80 | nc -lkvvp 443; done
```

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: ../../Build/shellScripts/pratica1.sh
[2]: ../../Build/shellScripts/pratica2.sh
[3]: ../../Build/shellScripts/pratica3.sh
[4]: ../../Build/shellScripts/pratica4.sh
[5]: ../../Build/shellScripts/pratica5.sh
[6]: ../../Build/shellScripts/pratica6.sh
[7]: https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
[8]: ../../Build/shellScripts/pratica7.sh
[9]: ../../Build/shellScripts/pratica8.sh
[10]: ../../Build/shellScripts/pratica9.sh
[11]: https://misc.flogisoft.com/bash/tip_colors_and_formatting

<!-- IMAGES -->