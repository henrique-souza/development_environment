# Instalação de Ambiente de Desenvolvimento

1. Executar ```wsl --install```
2. Reinciar o PC
3. Digitar user e senha pode ser um espaço
4. Abrir o [Documentação do Arch Linux pra WSL 2](https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/)
5. Baixar zip, extrair o zip e colar no Disco Local
6. Abrir a pasta C:\Arch e rodar ```.\Arch``` para que o **Arch.exe** seja executado
    - Reiniciar o PC novamente
7. Depois do Arch instalado, podemos abrir o sistema.
8. Voltamos para [Documentação do Arch Linux pra WSL 2](https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/) e seguimos as [Configurações após a instalação](https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/#configura%C3%A7%C3%A3o-ap%C3%B3s-a-instala%C3%A7%C3%A3o), não precisando fazer o passo de senha, apenas se necessite.
9. Rode ```sudo pacman -Syyuu``` pra atualizar o sistema
10. Depois rode um ```sudo pacman -S wget``` e depois ```code .``` pra poder instalar e testar o Visual Studio Code no Arch.

11. Para instalar o LunarVim, precisamos:
    - Instalar git com ```sudo pacman -S git```
    - Configurar o git com ```git config --global user.name "Seu nome completo" ``` e ```git config --global user.email seuemail@exemplo.br" ```
    - Instalar **neovim** com ```sudo pacman -S neovim```
    - E seguir as instalações que a [Documentação do LunarVim lista](https://www.lunarvim.org/docs/installation#prerequisites), como **make**, **pip** (com o comando ```sudo pacman -S python-pip```), **Python** e principalmente o **Cargo** (gestor de sistema e pacotes de **Rust**).
        - Para instalar o Node.js, precisamos rodar ```sudo pacman -S curl``` e ```curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash``` e rode um ```nvm install --lts``` para instalar o Release do Node.
12. Depois de todos passos acima, precisamos executar um ```export PATH=~/.cargo/bin:~/.local/bin:$PATH``` para poder habilitar tudo que instalamos anteriormente
13. Executando ```lvim``` o LunarVim é aberto normalmente. Com a tecla **Espaço** dá pra acessar alguns dos menus principais do LunarVim e ```Ctrl + H``` vai pro lado esquerdo e ```Ctrl + L``` vai pro lado direito
