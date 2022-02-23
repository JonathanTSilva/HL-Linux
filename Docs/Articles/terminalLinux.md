<!-- LOGO DIREITO -->
<a href="#customização-do-windows-terminal"><img width="200px" src="https://c2.staticflickr.com/2/1478/26633767625_443e0b9550_b.jpg" align="right" /></a>

# Customização do terminal do Linux

<p align="left">
  <a href="https://github.com/JonathanTSilva/HL-Linux">
    <img src="https://img.shields.io/static/v1?label=HomeLab&message=Linux&color=orange&logo=linux&logoColor=white&labelColor=grey&style=flat" alt="HL-Linux">
  </a>
</p>

:gear: Um guia de como customizar o terminal do Linux.

<!-- SUMÁRIO -->
- [Customização do terminal do Linux](#customização-do-terminal-do-linux)
  - [1. Oh-My-ZSH (ZSHELL)](#1-oh-my-zsh-zshell)
    - [1.1. Instalar o Zsh e alterar para shell padrão](#11-instalar-o-zsh-e-alterar-para-shell-padrão)
    - [1.2. Instalar o Oh My Zsh](#12-instalar-o-oh-my-zsh)
    - [1.3. Alterar o tema e instalar temas externos](#13-alterar-o-tema-e-instalar-temas-externos)
    - [1.4. Powerline fonts](#14-powerline-fonts)
    - [1.5. Instalar e habilitar plugins](#15-instalar-e-habilitar-plugins)
      - [1.5.1. zsh-history-substring-search](#151-zsh-history-substring-search)
      - [1.5.2. zsh-syntax-highlighting](#152-zsh-syntax-highlighting)
      - [1.5.3. zsh-autosuggestions](#153-zsh-autosuggestions)
      - [1.5.4. ls](#154-ls)
  - [2. Oh-My-Posh (POWERSHELL)](#2-oh-my-posh-powershell)
    - [2.1. Instalar o Oh My Posh](#21-instalar-o-oh-my-posh)
    - [2.2. Atualizar o Oh My Posh](#22-atualizar-o-oh-my-posh)
    - [2.3. Definir o Oh My Posh como padrão](#23-definir-o-oh-my-posh-como-padrão)
    - [2.4. Alterar o tema](#24-alterar-o-tema)
  - [3. Starship](#3-starship)

Uma das maiores paixões de usuários linux é a possibilidade de customizar o terminal de acordo com sua preferência, por ser uma das ferramentas mais utilizadas dentro deste ambiente. Este tópico aborda como customizar o terminal utilizando duas tecnologias: **Oh My Zsh** (ZShell) e **Oh My Posh** (PowerShell).

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 1. Oh-My-ZSH (ZSHELL)

### 1.1. Instalar o Zsh e alterar para shell padrão

O primeiro passo é instalar o Zshell, que já está disponível no repositório da maioria das distribuições Linux, então fica fácil de instalar, mas caso você queria fazer de forma manual, há também a [página no GitHub][1] dele, lá você encontra informações sobre um projeto chamado “Oh My ZSH!” que vai turbinar o seu ZSH ainda mais, caso você queria extrair ainda mais do potencial da ferramenta.

No Ubuntu o processo de instalação via terminal é assim:

```zsh
sudo apt install zsh
```

Feito isso, o ZSH já está instalado em sua máquina. Basta conferir a versão com `zsh --version`

Para alterar o ZSH para terminal padrão do seu ambiente Linux, utilizar o comando:

```zsh
chsh -s /bin/zsh
```

Para testar, abra o terminal e adicione o seguinte comando: `echo $0`. Isso deve retornar `zsh`. Outra opção, é editar o arquivo **passwd** que fica dentro deste diretório:

```zsh
sudo gedit /etc/passwd
```

Procure pela linha `/bin/bash` do seu usuário e altere `bash` para `zsh`. Deve ter algo como: `:/home/user:/bin/zsh`. Por fim, salve o documento, feche-o e logue em uma nova sessão no terminal.

### 1.2. Instalar o Oh My Zsh

Toda a documentação mais detalhada pode ser lida na [página **Oh My Zsh** do GitHub][1].

Seguindo o tutorial fornecido por eles, podemos instalá-lo utilizando `curl`, `wget` ou outra ferramenta similar.

| Method    | Command                                                                                           |
|:----------|:--------------------------------------------------------------------------------------------------|
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` |

```zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Com isso, o Oh My Zsh estará instalado na sua máquina e assim que o terminal for aberto novamente, já estará ativado e o arquivo `.zshrc`, alterado.

### 1.3. Alterar o tema e instalar temas externos

Qualquer alteração a ser feita no Oh My Zsh, deve ser realizada dentro do arquivo `.zshrc`. Uma delas é a alteração de tema, na qual deve ser realizada alterando o valor do parâmetro a seguir com o nome das extensões fornecidas pelo zsh:

```zsh
ZSH_THEME="agnoster"
```

Se os temas padrão não forem do seu agrado, há a possibilidade de realizar a instalação de temas externo, desenvolvidos pela comunidade, podendo ser conferidos pela página do GitHub: [External-Links][2]. Cada um deles tem na descrição os passos para instalação e configuração. Alguns entre os mais utilizado são: zsh2000, powerlevel10k, powerlevel9k, bullet-train, classyTouch, agnosterzak, solus, blokkzh, imp.

Para instalá-los, basta fazer o download do tema pelo GitHub, mover para a pasta `~/.oh-my-zsh/themes` e alterar a variável citada acima, dentro de `.zshrc`. Como exemplo, o download e importação do **powerlevel10k**:

```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
echo 'source ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

```zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

> **Nota:** muitos temas precisam da instalação de fontes externas para que funcione corretamente, como [Nerd Fonts][3], [Powerline Fonts][4], entre outras. Assim, abaixo está um guia rápido de instalação da biblioteca de fontes Powerline.

### 1.4. Powerline fonts

Uma instalação rápida pode ser feita com:

```zsh
sudo apt install fonts-powerline
```

Se não der certo, rode `.install.sh` para instalar todas Powerline fonts ou veja a [sua documentação][5] para mais detalhes.

```zsh
git clone https://github.com/powerline/fonts.git --depth=1 #clone
cd fonts #install
./install.sh
sudo fc-cache -fv #refresh the font cache, saves logging out and back in
cd ..
rm -rf fonts #clean-up a bit
```

Para desinstalar, trocar `./install.sh` por `./uninstall.sh`. Após instalação, deve ser alterada a fonte no terminal que estiver utilizando, até mesmo no Visual Studio Code. No caso de um terminal GNOME, vá para `Preferences` > `Seu perfil` > `Text` > `Custom fonts` e selecione a fonte Powerline de sua preferência. Já no Visual Studio Code, basta abrir a palheta de comandos (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>) e procurar por **Preferences: Open Settings (UI)**. Ao abrir, pesquisar por **Font**, expandir o **Text Editor** e selecionar **Font**. No campo **Editor: Font Family**, acrescentar o nome da fonte de sua preferência dentro de aspas simples. Ex: `'DejaVu Sans Mono for Powerline', 'CaskaydiaCove NF', Consolas, 'Courier New', monospace`. Outro caminho para esta solução, é alterar diretamente no settings.json so VSCode, pelo parâmetro `"editor.fontFamily"`. Caso queira alterar apenas a fonte para o terminal, colocar o nome da fonte dentro do parâmetro `"terminal.integrated.fontFamily"`.

### 1.5. Instalar e habilitar plugins

Existem vários plugins que poderão ser utilizados sem nenhuma instalação adicional. Para ver a lista de plugins que por padrão estão no diretório `~/.oh-my-zsh/plugins/` execute:

```zsh
cd ~/.oh-my-zsh/plugins/
ls -a
```

Para configurar algum plugin já disponibilizado pelo Oh My Zsh, é necessário editar também o arquivo `~/.zshrc` adicionando ou removendo na matriz de variáveis os nomes dos plugins, como o meu exemplo atual:

```zsh
plugins=( 
  git 
  dnf 
  zsh-history-substring-search 
  zsh-syntax-highlighting 
  zsh-autosuggestions 
  ls
)
```

Abaixo, estão alguns dos plugins mais utilizados e suas respectivas formas de instalação:

#### 1.5.1. zsh-history-substring-search

Adiciona um histórico de pesquisa, na qual, ao digitar qualquer parte de um código, é dada asa respectivas correspondências.

```zsh
git clone https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_CUSTOM/plugins/zsh-history-substring-search
```

Agora para definir ele como um dos plugins do seu ZSH, entre em `~/.zshrc`, procure uma parte com `plugins=()` e edite:

```zsh
plugins=( zsh-history-substring-search )
```

#### 1.5.2. zsh-syntax-highlighting

Adiciona syntax Highligth no nosso ZSH, facilitando você saber se o comando que está sendo digitado no momento está correto.

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Assim como o plugin anterior (e todos os outros), adicione ao `~/.zshrc`:

```zsh
plugins=( zsh-syntax-highlighting )
```

#### 1.5.3. zsh-autosuggestions

Adiciona uma auto-sugestão no ZSH baseada em seu histórico, tornando mais fácil a repetição de comandos já utilizados.

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

Da mesma forma:

```zsh
plugins=( zsh-autosuggestions )
```

#### 1.5.4. ls

Este plugin melhora a saída de `ls` e adiciona os seguintes *aliases*:

- `l` - mostrar arquivos;
- `ls` - mostrar arquivos;
- `la` - mostrar todos os arquivos;
- `ll` - mostrar arquivos linha por linha.

Baixe o script ou clone este repositório no diretório de [plugins do oh-my-zsh][14]:

```zsh
cd  ~ /.oh-my-zsh/custom/plugins
git clone https://github.com/zpm-zsh/ls.git
```

Assim como os outros, ative o plugin em `~/.zshrc`:

```zsh
plugins=( ls )
```

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 2. Oh-My-Posh (POWERSHELL)

O Oh My Posh é uma engine customizada de prompt para qualquer shell que apresenta a habilidade de ajustar a string do prompt como uma variável ou função. Ele suporta todos os shells populares no Linux, macOS e Windows, incluindo **Bash**, **Fish**, **Zsh**, **Powershell** e outros, tornando possível obter um prompt consistente, mesmo que você alterne frequentemente entre diferentes shells.

### 2.1. Instalar o Oh My Posh

Neste artigo, o foco será sua utilização no Zsh. Entretanto, há diversas formas de realizar a instalação do Oh My Posh, podendo ser acompanhadas pela [página principal do projeto][6], ou pela [galeria de pacotes do PowerShell][7].

> **Notes:** Oh My Posh utiliza o código de cores ANSI por baixo dos panos, o que deveria funcionar em todos os terminais, mas você pode ter que definir a variável de ambiente `$TERM` para `xterm-256color` para que funcione normalmente.

O método mais fácil para realizar o seu download e instalação é pelo gerenciador de pacotes Homebrew para Linux. Sua instalação pode ser realizada acompanhando [documentação][8] no site. Após a instalação certifique-se de seguir as [instruções de próximas etapas][9] para adicionar o Homebrew ao seu PATH e ao script de perfil do shell bash. Feito isso, os comandos abaixo instalarão o Oh My Posh em seu Linux.

```zsh
brew tap jandedobbeleer/oh-my-posh
brew install oh-my-poshv
```

Isso instala o `oh-my-posh.exe` e os últimos [temas do Oh My Posh][10]. Para conferir, basta copiar este comando do executável no cmd e será possível visualizar sua interface. Porém, só realizar este procedimento não o colocará como a engine padrão do PowerShell.

### 2.2. Atualizar o Oh My Posh

Para atualizar com o Homebrew, utilizar:

```zsh
brew update && brew upgrade oh-my-posh && exec zsh
```

### 2.3. Definir o Oh My Posh como padrão

Para defini-lo como padrão do sistema, adicione o seguinte comando em `~/.zshrc`:

```zsh
eval "$(oh-my-posh --init --shell zsh --config ~/jandedobbeleer.omp.json)"
```

Uma vez adicionado, recarregue seu perfil para que as mudanças sejam feitas.

```zsh
eval "$source ~/.zshrc
```

### 2.4. Alterar o tema

O tema padrão **jandedobbeleer.omp.json** exibe os casos de uso mais comuns em seu prompt. No entanto, se você quer ir mais além para explorar funcionalidades adicionais, siga as etapas adicionais abaixo para te auxiliar neste começo.

Explore os [temas oficiais do Oh My Posh][10]. Caso encontre algum que lhe agrade, basta conferir se ele já está baixado no diretório de temas (`$(brew --prefix oh-my-posh)\themes\`) e alterar no arquivo `.zshrc`, como exemplo abaixo:

```zsh
eval "$(oh-my-posh --init --shell zsh --config '~/.agnoster.omp.json')"
```

Se gostou parcialmente do tema e quiser editá-lo, criando o seu próprio, leia primeiro todas as opções disponíveis, começando pelo [guia de configuração][11]. Você pode enviar o seu tema atual para o formato que desejar (`json`, `yaml` ou `toml`) que pode ser usado para ajustar e armazenar como seu tema personalizado.

```zsh
export_poshconfig "~/.mytheme.omp.json" json
```

Quando terminar de editar, ajuste o seu `.zshrc` para usar o tema recém-criado.

```zsh
eval "$(oh-my-posh --init --shell zsh --config '~/.mytheme.omp.json')"
```

Quando ajustado, recarregue o seu perfil para que as mudanças sejam efetivadas.

```zsh
. ~/.zshrc
```

> **Cuidado:** Para temas baixados e colocados naquele diretório de *themes* do Oh My Posh, é necessário adicionar o caminho inteiro do diretório, como `~\oh-my-posh\themes\ohmyposhv3-v2.json`, ou a pasta em que ele se encontra.

O tema que utilizo atualmente é o desenvolvido por **shanselman**, chamado **ohmyposhv3-v2.json** e está disponível na [página de gist][12] do desenvolvedor, assim como o arquivo `$PROFILE` personalizado.

<!-- VOLTAR AO ÍNICIO -->
<a href="#"><img width="40px" src="https://github.com/JonathanTSilva/JonathanTSilva/blob/main/Images/back-to-top.png" align="right" /></a>

## 3. Starship

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://github.com/ohmyzsh/ohmyzsh
[2]: https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes
[3]: https://www.nerdfonts.com/
[4]: https://github.com/powerline/fonts
[5]: https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation
[6]: https://ohmyposh.dev/docs/windows
[7]: https://www.powershellgallery.com/packages/oh-my-posh/7.5.1
[8]: https://brew.sh/
[9]: https://docs.brew.sh/Homebrew-on-Linux#install
[10]: https://ohmyposh.dev/docs/themes
[11]: https://ohmyposh.dev/docs/config-overview
[12]: https://gist.github.com/shanselman/
[13]: https://gist.github.com/JonathanTSilva
[14]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins

<!-- IMAGES -->
