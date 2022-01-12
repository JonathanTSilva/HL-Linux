<!-- Simple logo -->
<a href="#meu-guia-de-linux"><img width="100px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/1200px-Tux.svg.png" align="right" /></a>

# Meu guia de Linux

🛠 Passo a passo que adoto na minha utilização do Linux.

## 1. Ubuntu e Debian

### 1.1. Básico

#### 1.1.1. Instalação de programas

Abaixo estão alguns passos utilizados para a instalação de softwares no linux:

**I. Atualizar pacotes já instalados**

```console
sudo apt-get update
```

Esse comando vai atualizar a base de dados dos pacotes para que você tenha acesso às versões mais atualizadas dos softwares.

**II. Instalar por um repositório terceiro**

Se quiser instalar um programa de um repositório específico de terceiros, adicione-o usando o seguinte comando: 

```console
sudo add-apt-repository <nome do repositório>
```

**III. Caso não saiba o nome do pacote**

Caso não saiba o nome do pacote que deseja instalar, é possível procurá-lo pelo comando:

```console
apt-cache search <termo de busca>
```

Uma lista irá aparecer com todos os pacotes que correspondem com o termo em questão. Se muitos itens forem exibidos de uma só vez, digite novamente o comando e dê um espaço para navegar pela lista. Para consultar mais detalhes sobre o pacote, execute o comando `apt-cache showpkg <nome do pacote>`, que irá exibir a versão do software, dependências e outras informações.

**IV. Instalando o pacote**

```console
sudo apt-get install <nome do pacote>
```

Para atualizar um pacote já instalado sem precisar reinstalá-lo, use o comando:

```console
sudo apt-get install <nome do pacote> --only-upgrade
```

**V. Listando os pacotes instalados**

```console
sudo dpkg –list
```

O comando acima irá listar todos os pacotes instalados na máquina. Se a lista for longa demais, use a barra de espaço para navegar entre os resultados.

**VI. Deletando algum pacote**

```console
sudo apt-get remove <nome do pacote>
```

Essa opção vai remover os binários instalados dele (mas não os arquivos de configuração). Para remover por completo algum software, utilize:

```console
sudo apt-get purge <nome do pacote>
```
