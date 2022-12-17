# Instalação de Ambiente de Desenvolvimento

1. Executar ```wsl --install``` em algum Terminal

2. Reinciar o PC e abrir novamente o Terminal
    - Se não iniciar no Ubuntu, abrir o Ubuntu

3. Digitar user e senha (pode ser um espaço)

4. Abrir o [Documentação do Arch Linux pra WSL 2][def]

5. Baixar zip, extrair o zip e no Disco Local

6. Abrir a pasta C:\Arch e rodar ```.\Arch``` para que o **Arch.exe** seja executado
    - Reiniciar o PC novamente

7. Depois do Arch instalado, podemos abrir o sistema.

8. Voltamos para [Documentação do Arch Linux pra WSL 2][def] e seguimos as [Configurações após a instalação][def2], não precisando fazer o passo de senha, apenas se preferir.

9. Rode ```sudo pacman -Syyuu``` pra atualizar o sistema

10. Depois rode um ```sudo pacman -S wget``` e depois ```code .``` pra poder instalar e testar o Visual Studio Code no Arch.

11. Para instalar o **LunarVim**, precisamos:
    - Instalar **base-devel** com ```sudo pacman -S base-devel```
    - Instalar **Git** com ```sudo pacman -S git```
        - Configurar o git com ```git config --global user.name "Seu nome completo"``` e ```git config --global user.email seuemail@exemplo.br"```
    - Instalar **neovim** com ```sudo pacman -S neovim```
    - E seguir as instalações que a [Documentação do LunarVim lista][def3], como **make**, **pip** (com o comando ```sudo pacman -S python-pip```), **Python** e principalmente o [**Cargo** (gestor de sistema e pacotes de **Rust**)][def7].
        - Para instalar o **Node.js**, precisamos rodar ```sudo pacman -S curl``` e ```curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash``` e rode um ```nvm install --lts``` para instalar o Release do Node.

12. Depois de todos passos acima, precisamos executar um ```export PATH=~/.cargo/bin:~/.local/bin:$PATH``` para poder habilitar tudo que instalamos anteriormente

13. Executando ```lvim``` o LunarVim é aberto normalmente.
    - Com a tecla **Espaço** dá pra acessar alguns dos menus principais do LunarVim e ```Ctrl + H``` vai pro lado esquerdo e ```Ctrl + L``` vai pro lado direito

14. Instalar o **yay**:
    - Abrir a pasta temporária do Arch com ```cd /tmp```
    - Clonar o repositório do Yay ```git clone https://aur.archlinux.org/yay.git```
    - Rodar ```cd yay```
    - Depois rodar ```makepkg -si``` para instalar o Yay

15. A partir deste momento, banimos o uso do ```pacman``` e usaremos ```yay``` para instalar dependencias. E vamos instalar o ```zsh```

16. Instalar o **ZSH**:
    - Rodar ```yay -S zsh```

17. Instalar o **PowerLevel10k**:
    - Seguir [documentação do PowerLeve10k para Arch Linux][def4]

18. Executar o comando ```chsh -s /usr/bin/zsh``` pra [padronizar o zsh como o Shell principal][def5]

19. Abrir nova aba pra poder configurar o ZSH
    - Caso queira mudar alguma configuração indesejada, rodar ```p10k configure```

20. Se tentar abrir o LunarVim de qualquer lugar dentro do Arch, neste momento, não iremos conseguir, pois ainda falta uma configuração no ZSH:
    - Abrir as configurações do ZSH executando ```code ~/.zshrc```
    - Digitar ```export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH``` no final do documento e salvar o documento
    - Ao abrir novamente o Arch, podemos rodar ```lvim``` na HOME para poder chamar o Lunar Vim.

21. Um plugin conhecido pro ZSH seria o [zsh-autosuggestions][def6]:
    - Primeiro vamos criar uma pasta chamada ```.zsh``` na home do Arch
    - Depois iremos seguir a [instalação da documentação][def6] e abrir novo terminal pra settar o novo plugin

22. Pra habilitar o comando ```./bin/setup``` (**no caso do Rails**) no Terminal, precisamos rodar ```chmod +x bin/setup```

23. Instalar linguagem a ser usada e usar o Arch[^1].

[^1]: Em breve atualizar documentação pra Inglês

[def]: https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/
[def2]: https://wsldl-pg.github.io/ArchW-docs/locale/pt-BR/How-to-Setup/#configura%C3%A7%C3%A3o-ap%C3%B3s-a-instala%C3%A7%C3%A3o
[def3]: https://www.lunarvim.org/docs/installation#prerequisites
[def4]: https://github.com/romkatv/powerlevel10k#arch-linux
[def5]: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
[def6]: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
[def7]: https://www.rust-lang.org/tools/install
