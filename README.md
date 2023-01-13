# Instalação de Ambiente de Desenvolvimento

1. Executar ```wsl --install``` em algum Terminal

2. Reinciar o PC e abrir novamente o Terminal
    - Se o computador não iniciar com Ubuntu aberto, abra o Ubuntu através do Terminal

3. Digitar user e senha ~~(pode ser um espaço)~~

4. Abrir a [documentação do Arch Linux pra WSL 2][def]

5. Baixar ZIP, extrair o ZIP no Disco Local

6. Abrir a pasta C:\Arch com ```cd Arch``` e rodar ```.\Arch``` para que o **Arch.exe** seja executado

7. Depois do Arch instalado, verifique se a opção "**Executar esse perfil como Administrador**" está marcada, no Windows Terminal, dentro do perfil do Arch, e então podemos abrir o sistema.

8. Voltamos para [Documentação do Arch Linux pra WSL 2][def] e seguimos as [Configurações após a instalação][def2]. Vamos até os [passos finais][def8] neste tópico
    - Nos comandos iniciais, precisamos avisar qual usuário será o padrão para o Arch
    - Precisamos abrir novamente o Terminal (sem ser o do Arch)
    - Abrir a pasta com ```cd Arch```
    - E digitar ```.\Arch.exe config --default-user {seu usuário}``` (se você estiver na Prompt de Comando, não precisa digitar **".\\"** no início do comando)

9. Para atualizar o Arch, antes dos demais comandos:
    ```shell
    sudo pacman -Syyuu
    ```

10. Vamos executar o comando abaixo e depois digitar ```code .``` no Terminal pra poder instalar e testar o Visual Studio Code no Arch
    ```shell
    sudo pacman -S wget
    ```

>   Estava intrigado pra saber qual a IDE que o DHH usa em seus vídeos ou em seu trabalho, e se chama **TextMate**, que é disponível apenas para Mac. Para Linux, temos a opção chamada [**Mate**][mate_installation]


11. Para instalar o **LunarVim**, precisamos :
     - Instalar **base-devel**
        ```shell
        sudo pacman -S base-devel
        ```
    - Instalar **Git**
        ```shell
        sudo pacman -S git
        ```
        - Configurar o **Git** com os comandos
             ```shell
             git config --global user.name "Seu nome completo"
             ```
             ```shell
             git config --global user.email seuemail@exemplo.br
             ```
    - Instalar **NeoVim**
        ```shell
        sudo pacman -S neovim
        ```
    - E seguir as instalações que a [Documentação do LunarVim lista][def3], como **Python**, executando comando abaixo, e principalmente o [**Cargo** (gestor de sistema e pacotes de **Rust**)][def7].
        ```shell
        sudo pacman -S python-pip
        ```
        - Para [instalar o **Node.js**](https://learn.microsoft.com/pt-br/windows/dev-environment/javascript/nodejs-on-wsl#install-nvm-nodejs-and-npm), precisamos rodar
            ```shell
            sudo pacman -S curl
            ```
            e
            ```shell
            curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
            ```
            reinicie o Arch e para instalar o Release do Node
            ```shell
            nvm install --lts
            ```

12. Depois de todos passos acima, precisamos executar o comando abaixo para poder habilitar tudo que instalamos anteriormente e depois, finalmente [instalar o LunarVim com o comando descrito][def9] e todas suas dependencias
    ```shell
    export PATH=~/.cargo/bin:~/.local/bin:$PATH
    ```

13. Depois dos passos acima, ao digitar ```lvim``` no Terminal, o LunarVim é aberto normalmente
    - Com a tecla **```Espaço```** dá pra acessar alguns dos **menus principais** do LunarVim e ```Ctrl + H``` vai pro lado esquerdo e ```Ctrl + L``` vai pro lado direito

14. Instalar o **yay**:
    - Abrir a pasta temporária do Arch com ```cd /tmp``` e executar
        ```shell
        git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
        ```

15. A partir deste momento, banimos o uso do ```pacman``` e usaremos ```yay``` para instalar dependencias. E vamos instalar o ```zsh```

16. Instalar o **ZSH**
    ```shell
    yay -S zsh
    ```

17. Instalar o **PowerLevel10k**:
    - Seguir [documentação do PowerLeve10k para Arch Linux][def4]
    - Depois do passo da documentação, precisamos instalar o [pacote de fontes MesloLGS NF][def10] e mudar o **Tipo de fonte** do perfil do Arch, no Terminal, para o MesloLGS NF recém instalado
    - Após instalar e configurar a fonte, precisaremos rodar o comando abaixo para poder instalar as dependências necessárias para o PL10K
        ```shell
        yay -S powerline-fonts awesome-terminal-fonts
        ```

18. Executar o comando ```chsh -s /usr/bin/zsh``` pra [padronizar o zsh como o Shell principal][def5]

19. Abrir nova aba pra poder configurar o ZSH
    - Caso queira mudar alguma configuração indesejada, rodar
        ```shell
        p10k configure
        ```

20. Se tentar abrir o LunarVim de qualquer lugar dentro do Arch, neste momento, não iremos conseguir, pois ainda falta uma configuração no ZSH:
    - Abrir as configurações do ZSH executando ```code ~/.zshrc```
    - E colar o comando abaixo no final do documento e salvar o documento
        ```shell
        export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH
        ```
    - Ao abrir novamente o Arch, podemos rodar ```lvim``` na HOME para poder chamar o Lunar Vim.

21. Um plugin conhecido pro ZSH seria o [zsh-autosuggestions][def6]:
    - Primeiro vamos criar uma pasta chamada ```.zsh``` na home do Arch usando comando
        ```shell
        mkdir .zsh
        ```
    - Depois iremos seguir a [instalação da documentação][def6] e abrir novo terminal pra settar o novo plugin

22. Pra habilitar o comando ```./bin/setup``` (**no caso do Rails**) no Terminal, precisamos rodar
    ```shell
    chmod +x bin/setup
    ```

23. Instalar linguagem a ser usada e usar o Arch[^1].

24. Instalar o [asdf][asdf]
    - Rodar (...)

25. No caso do Ruby e Rails, como eu tive algumas dores de cabeça até entender legal, vou deixar aqui que a instalação mais fácil que consegui foi através do [Rbenv][def11] para este ambiente.

26. Deixando nota aqui também sobre [atualização de versão do Ruby ao usar rbenv][ruby_updates]

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
[def11]: https://github.com/rbenv/rbenv#basic-git-checkout
[mate_installation]: https://wiki.mate-desktop.org/introduction/installation/#linux
[ruby_updates]: https://github.com/henrique-souza/crypto_wallet/blob/master/docs/notes.md#atualiza%C3%A7%C3%A3o-de-ruby
[asdf]: https://asdf-vm.com/pt-br/guide/introduction.html#introducao
