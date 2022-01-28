<!-- RIGHT LOGO -->
<a href="#customização-do-windows-terminal"><img width="300px" src="https://c2.staticflickr.com/2/1478/26633767625_443e0b9550_b.jpg" align="right" /></a>

# Customização do terminal do Linux

:gear: Um guia de como customizar o terminal do Linux.

<!-- TABLE OF CONTENTS -->
- [Customização do terminal do Linux](#customização-do-terminal-do-linux)
  - [ZSHELL - Oh-My-ZSH](#zshell---oh-my-zsh)
    - [Instalando o Zsh e alterando para shell padrão](#instalando-o-zsh-e-alterando-para-shell-padrão)
    - [Instalando o Oh My Zsh](#instalando-o-oh-my-zsh)
    - [Alterando o tema e instalando temas externos](#alterando-o-tema-e-instalando-temas-externos)
    - [Powerline fonts](#powerline-fonts)
    - [Instalando e habilitando plugins](#instalando-e-habilitando-plugins)
      - [zsh-history-substring-search](#zsh-history-substring-search)
      - [zsh-syntax-highlighting](#zsh-syntax-highlighting)
      - [zsh-autosuggestions](#zsh-autosuggestions)
  - [POWERSHELL - Oh-My-Posh](#powershell---oh-my-posh)

Uma das maiores paixões de usuários linux é a possibilidade de customizar o terminal de acordo com sua preferência, por ser uma das ferramentas mais utilizadas dentro deste ambiente. Este tópico aborda como customizar o terminal utilizando duas tecnologias: **Oh My Zsh** (ZShell) e **Oh My Posh** (PowerShell).

## ZSHELL - Oh-My-ZSH

### Instalando o Zsh e alterando para shell padrão

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

### Instalando o Oh My Zsh

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

### Alterando o tema e instalando temas externos

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

### Powerline fonts

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


### Instalando e habilitando plugins

Existem vários plugins que poderão ser utilizados sem nenhuma instalação adicional. Para ver a lista de plugins que por padrão estão no diretório `~/.oh-my-zsh/plugins/` execute:

```zsh
cd ~/.oh-my-zsh/plugins/
ls -a
```

Para configurar algum plugin já disponibilizado pelo Oh My Zsh, é necessário editar também o arquivo `~/.zshrc` adicionando ou removendo na matriz de variáveis os nomes dos plugins, por exemplo:

```zsh
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
)
```

Abaixo, estão alguns dos plugins mais utilizados e suas respectivas formas de instalação:

#### zsh-history-substring-search

Adiciona um histórico de pesquisa, na qual, ao digitar qualquer parte de um código, é dada asa respectivas correspondências.

```zsh
git clone https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_CUSTOM/plugins/zsh-history-substring-search
```

Agora para definir ele como um dos plugins do seu ZSH, entre em `~/.zshrc`, procure uma parte com `plugins=()` e edite:

```zsh
plugins=( git dnf zsh-history-substring-search )
```

#### zsh-syntax-highlighting

Adiciona syntax Highligth no nosso ZSH, facilitando você saber se o comando que está sendo digitado no momento está correto.

```zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Assim como o plugin anterior (e todos os outros), adicione ao `~/.zshrc`:

```zsh
plugins=( git dnf zsh-history-substring-search zsh-syntax-highlighting )
```

#### zsh-autosuggestions

Adiciona uma auto-sugestão no ZSH baseada em seu histórico, tornando mais fácil a repetição de comandos já utilizados.

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

Da mesma forma:

```zsh
plugins=( git dnf zsh-history-substring-search zsh-syntax-highlighting zsh-autosuggestions)
```

## POWERSHELL - Oh-My-Posh

<!-- MARKDOWN LINKS -->
<!-- SITES -->
[1]: https://github.com/ohmyzsh/ohmyzsh
[2]: https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes
[3]: https://www.nerdfonts.com/
[4]: https://github.com/powerline/fonts
[5]: https://powerline.readthedocs.io/en/latest/installation/linux.html#fonts-installation

<!-- IMAGES -->
