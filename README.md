# Arch Linux com WSL 2

## Instalando o WSL2

Executar ```wsl --install``` em algum Terminal

Reinciar o PC e abrir novamente o Terminal

- Se o computador não iniciar com Ubuntu aberto, abra o Ubuntu através do Terminal

Digitar user e senha ~~(pode ser um espaço)~~

Abrir a [documentação do Arch Linux pra WSL 2][def]

Baixar ZIP, extrair o ZIP no Disco Local

Abrir a pasta C:\Arch com ```cd Arch``` e rodar ```.\Arch``` para que o **Arch.exe** seja executado

Depois do Arch instalado, verifique se a opção "**Executar esse perfil como Administrador**" está marcada, no Windows Terminal, dentro do perfil do Arch, e então podemos abrir o sistema.

Voltamos para [Documentação do Arch Linux pra WSL 2][def] e seguimos as [Configurações após a instalação][def2]. Vamos até os [passos finais][def8] neste tópico

1. Nos comandos iniciais, precisamos avisar qual usuário será o padrão para o Arch e, pra isso, precisamos abrir novamente o Terminal (sem ser o do Arch)

1. Abrir a pasta com ```cd Arch```

1. E digitar (se você estiver na Prompt de Comando, não precisa digitar `.\` no início do comando)

    ```bash
    .\Arch.exe config --default-user {seu usuário}
    ```

Para atualizar o Arch, antes dos demais comandos:

```bash
sudo pacman -Syyuu
```

Às vezes será necessário ficar em dia com as credenciais do sistema. Pra isso deve-se utilizar:

```bash
sudo pacman -Syy archlinux-keyring
```
E depois, para atualizar as keys do Arch Linux:
```bash
sudo pacman-key --refresh-keys
```

## Primeiros comandos e configurações

1. Instalar **base-devel**

    ```bash
    sudo pacman -S base-devel
    ```

1. Instalar **Git**

    ```bash
    sudo pacman -S git
    ```

    1. Configurar o **Git** com os comandos

        ```bash
        git config --global user.name "Seu nome completo com espaços"
        ```

        ```bash
        git config --global user.email seuemail@exemplo.br
        ```

1. Configuração do GitHub CLI e Tokens do GitHub

    Se preferir, já adiante a configuração do token do GitHub ao seu terminal, instalando o [GitHub CLI][github_cli] e copiando seu token [(passo a passo de como fazer um está aqui)][github_token], você poderá configurá-lo usando o comando abaixo e seguindo as instruções:

    ```bash
    gh auth login
    ```

    Isso vai evitar mensagens chatas de erros com o gerenciamento dos seus repositórios no GitHub. Lembre-se de renovar sempre os Tokens e cadastrá-los novamente.

## Instalando IDE's

> Estava intrigado pra saber qual a IDE que o DHH usa em seus vídeos ou em seu trabalho, e se chama **TextMate**, que é disponível apenas para Mac. Para Linux, temos a opção chamada [**Mate**][mate_installation], mas ainda não consegui tempo pra testar. Parece muito com o [Sublime Text](https://github.com/henrique-souza/development_environment#sublime-text)

### Visual Studio Code

Vamos executar o comando abaixo e depois digitar ```code .``` no Terminal pra poder instalar e testar o Visual Studio Code no Arch

```bash
sudo pacman -S wget
```

A Microsoft disponibilizou um [guia para instalação de Ruby no VS Code][ruby_on_vscode] recentemente, com o uso da extensão poderosa **Ruby LSP**

### LunarVim

Para instalar o **LunarVim**, precisamos:

1. Instalar **NeoVim**

    ```bash
    sudo pacman -S neovim
    ```

1. E seguir as instalações que a [Documentação do LunarVim lista][def3], como **Python**, executando comando abaixo, e principalmente o [**Cargo** (gestor de sistema e pacotes de **Rust**)][def7].

    ```bash
    sudo pacman -S python-pip
    ```

    1. Para [instalar o **Node.js**](https://learn.microsoft.com/pt-br/windows/dev-environment/javascript/nodejs-on-wsl#install-nvm-nodejs-and-npm), precisamos rodar os comandos

        ```bash
        sudo pacman -S curl
        ```

        ```bash
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
        ```

        e reiniciar o Arch e para instalar o Release do Node

        ```bash
        nvm install --lts
        ```

Depois de todos passos acima, precisamos executar o comando abaixo para poder habilitar tudo que instalamos anteriormente e depois, finalmente [instalar o LunarVim com o comando descrito][def9] e todas suas dependencias

```bash
export PATH=~/.cargo/bin:~/.local/bin:$PATH
```

Depois dos passos acima, ao digitar ```lvim``` no Terminal, o LunarVim é aberto normalmente

- Com a tecla **```Espaço```** dá pra acessar alguns dos **menus principais** do LunarVim e ```Ctrl + H``` vai pro lado esquerdo e ```Ctrl + L``` vai pro lado direito

Se tentar abrir o LunarVim de qualquer lugar dentro do Arch, neste momento, não iremos conseguir, pois ainda falta uma configuração no ZSH:

1. Abrir as configurações do ZSH executando ```code ~/.zshrc```

1. E colar o comando abaixo no final do documento e salvar o documento

    ```bash
    export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH
    ```

1. Ao abrir novamente o Arch, podemos rodar ```lvim``` na HOME para poder chamar o Lunar Vim.

### AstroNvim

O AstroNvim tem sido uma ótima descoberta pra mim e creio que seja também uma ótima IDE para usar para desenvolvimento. Siga os passos [da documentação oficial do site do AstroNvim][astronvim] para instalação.

### Sublime Text

Para instalar o Sublime Text, podemos [seguir a documentação oficial][subl_docs] e, no fim, digitar

```bash
sudo pacman -Syu sublime-text
```

ou

```bash
yay -S sublime-text-{VERSION}
```

Depois de tudo instalado corretamente, ao digitar `subl` podemos abrir o Sublime.

#### Instalando Sublime Merge

Sublime Merge é a ferramenta de controle de versão do Sublime Text e age em conjunto com a IDE. Pra instalar [devemos seguir a documentação][sublime_merge].

O uso é dentro do Sublime Text mesmo, ao clicar no **nome da branch** ao lado direito inferior da IDE.

### JetBrains

Para instalar alguma IDE da JetBrains, precisamos rodar

```shell
yay -S fuse
```

que instala dependências para que a Toolbox da Jetbrains seja aberta, e

```shell
yay -S jetbrains-toolbox
```

para justamente instalar o gerenciador de IDE's da Jetbrains. Depois de tudo instalado, rode um `which jetbrains-toolbox` e depois `cd {PATH jetbrains-toolbox}` para ir até o caminho e abra a Box com o comando `jetbrains-toolbox`.

<!-- Depois só configurar usuário e procurar documentação sobre como chamar sua IDE preferida. No meu caso, uso  -->

## Instalando outros Gerenciadores de Pacote

### yay

O **yay** é um Arch User Repository (AUR), diferente do `pacman`.

Para instalá-lo, [siga a documentação][yay_installation], ou:

- Abrir a pasta temporária do Arch com ```cd /tmp``` e executar

    ```bash
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    ```

A partir deste momento, banimos o uso do ```pacman``` e usaremos ```yay``` para instalar dependencias.

## Instalando GitHub CLI

Para gerenciar senhas a cada `git push`, será necessário instalar a ferramenta do GitHub CLI e depois digitar `gh` no terminal e seguir as instruções. O comando para instalação do CLI é

```bash
yay -S github-cli
```

## Instalando o **ZSH**

Rodamos

```bash
yay -S zsh
```

### Personalizando o ZSH

#### Instalando o **PowerLevel10k**

1. Seguir [documentação do PowerLeve10k para Arch Linux][def4]

1. Depois do passo da documentação, precisamos instalar o [pacote de fontes MesloLGS NF][def10] e mudar o **Tipo de fonte** do perfil do Arch, no Terminal, para o MesloLGS NF recém instalado

1. Após instalar e configurar a fonte, precisaremos rodar o comando abaixo para poder instalar as dependências necessárias para o PL10K

    ```bash
    yay -S powerline-fonts awesome-terminal-fonts
    ```

Executar o comando ```chsh -s /usr/bin/zsh``` pra [padronizar o zsh como o bash principal][def5]

Abrir nova aba pra poder configurar o ZSH

- Caso queira mudar alguma configuração indesejada, rodar

    ```bash
    p10k configure
    ```

### Instalação de Plugins

Um plugin conhecido pro ZSH seria o [zsh-autosuggestions][def6]:

1. Primeiro vamos criar uma pasta chamada ```.zsh``` na home do Arch usando comando

    ```bash
    mkdir .zsh
    ```

1. Depois iremos seguir a [instalação da documentação][def6] e abrir novo terminal pra settar o novo plugin

## Instalando um Gerenciador de versões

### asdf

O `asdf` auxilia   [Seguindo a documentação do asdf][asdf]

1. Rodamos

    ```bash
    yay -S asdf-vm
    ```

1. Caso ele peça algumas dependências no final da instalação, pode instalar para que tudo funcione 100% garantido.

1. Vamos abrir novamente o ```.zshrc``` com ```code ~/.zshrc``` pra poder settar o asdf toda vez que abrimos o terminal, colando o comando abaixo e reiniciamos o Terminal:

    ```bash
    source /opt/asdf-vm/asdf.sh
    ```

1. A partir daqui você pode seguir a documentação do asdf para [instalação da sua linguagem através de plugins][asdf_plugins]. No meu caso, preciso instalar Ruby, então precisei digitar

    ```bash
    asdf plugin add ruby
    ```

1. Depois de instalado plugin do Ruby, posso consultar uma lista das versões de Ruby que posso baixar usando ```asdf list-all ruby```

1. Pra baixar e configurar a versão que estou usando em meus projetos atuais, precisei rodar

    ```bash
    asdf install ruby 3.2.0
    ```

    - ou use latest APENAS SE caso a ultima versão seja realmente a que você quer. **Prefira os números de qualquer forma**

        ```bash
        asdf install ruby latest
        ```

Pra poder dizer que essa versão do Ruby é a versão que quero para todo meu ambiente e seus projetos futuros, rodamos

```bash
asdf global ruby 3.2.0
```

ou (opicional)

```bash
asdf global ruby latest
```

- Pra poder mudar a versão do Ruby localmente em algum projeto, rodamos

    ```bash
    asdf local ruby 3.2.0
    ```

ou (opicional)

```bash
asdf local ruby latest
```

<!--
## Instalando Microsoft Edge

chamando o comando microsoft-edge-stable

 ## Instalando Docker

- Instalar [docker-desktop pra Windows](https://www.docker.com/products/docker-desktop/), e depois rodar (ainda escrevendo...)

```bash
yay -S docker
``` -->

## Por fim

Instalar linguagem a ser usada e usar o Arch[^1].

Pra habilitar o comando ```./bin/setup``` (**no caso do Rails**) no Terminal, precisamos rodar

```bash
chmod +x bin/setup
```

[^1]: Em breve atualizar documentação pra Inglês

[def]: https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/
[def2]: https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/#configura%C3%A7%C3%A3o-ap%C3%B3s-a-instala%C3%A7%C3%A3o
[def3]: https://www.lunarvim.org/docs/installation#prerequisites
[def4]: https://github.com/romkatv/powerlevel10k#arch-linux
[def5]: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
[def6]: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
[def7]: https://www.rust-lang.org/tools/install
[def8]: https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/#inicializar-o-chaveiro
[def9]: https://www.lunarvim.org/docs/installation#release
[def10]: https://github.com/romkatv/powerlevel10k#manual-font-installation
[mate_installation]: https://wiki.mate-desktop.org/introduction/installation/#linux
[asdf]: https://asdf-vm.com/pt-br/guide/introduction.html#introducao
[asdf_plugins]: https://asdf-vm.com/pt-br/guide/getting-started.html#_4-instalando-um-plugin
[subl_docs]: https://www.sublimetext.com/docs/linux_repositories.html#pacman
[yay_installation]: https://github.com/Jguer/yay#installation
[sublime_merge]: https://www.sublimemerge.com/docs/linux_repositories#pacman
[ruby_on_vscode]: https://code.visualstudio.com/docs/languages/ruby
[github_cli]: https://github.com/cli/cli
[github_token]: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens
[astronvim]: https://astronvim.com/
