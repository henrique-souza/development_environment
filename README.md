# anotacoes

1. ```wsl --install```
2. reinciar o PC
3. digitar user e senha pode ser um espaço
4. Abrir o [Documentação do Arch Linux pra WSL 2](https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/)
5. Baixar zip, extrair o zip e colar no Disco Local
6. Abrir a pasta C:\Arch e rodar ```.\Arch``` para que o **Arch.exe** seja executado
7. Depois do Arch instalado, podemos abrir o sistema.
8. Voltamos para [Documentação do Arch Linux pra WSL 2](https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/) e seguimos as [Configurações após a instalação](https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/#configura%C3%A7%C3%A3o-ap%C3%B3s-a-instala%C3%A7%C3%A3o), não precisando fazer o passo de senha, apenas se necessite.
9. Rode ```sudo pacman -Syyuu``` pra atualizar o sistema
10. Depois rode um ```sudo pacman -S wget``` e depois ```code .``` pra poder instalar e testar o Visual Studio Code no Arch.

11. Para instalar o LunarVim, precisamos:
    - Instalar git com ```sudo pacman -S git```
    - Configurar o git com ```git config --global user.name "Seu nome completo" ``` e ```git config --global user.email seuemail@exemplo.br" ```
    - E seguir as instalações que a [Documentação do LunarVim lista](https://www.lunarvim.org/docs/installation#prerequisites), como **make**, **pip** (com o comando ```sudo pacman -S python-pip```), **Python** e principalmente o **Cargo** (gestor de sistema e pacotes de **Rust**). Ao instalar o **npm**, o **Node.js** vem junto.
