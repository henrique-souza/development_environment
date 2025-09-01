#!/usr/bin/env bash
set -euo pipefail

# ======== Variáveis editáveis ========
# Exemplo: export GIT_NAME="Seu Nome"; export GIT_EMAIL="voce@exemplo.com"
GIT_NAME="${GIT_NAME:-Henrique Souza dos Santos}"
GIT_EMAIL="${GIT_EMAIL:-h.s.s_henrique@hotmail.com}"
SHELL_RC="${SHELL_RC:-$HOME/.zshrc}"     # ~/.bashrc ou ~/.zshrc
INSTALL_ASDF="${INSTALL_ASDF:-1}"        # 1 para instalar asdf
INSTALL_P10K_FONTS="${INSTALL_P10K_FONTS:-1}"  # 0 para pular fontes Meslo

# Como rodar:
# chmod +x bootstrap.sh
# ./bootstrap.sh

# ======== Pré-requisitos / sudo ========
sudo -v || true

# ======== Keyring e atualização inicial (Arch/WSL) ========
# Mantém o chaveiro coerente e sistema atualizado
if ! pacman -Qi archlinux-keyring >/dev/null 2>&1; then
  sudo pacman -Sy --noconfirm archlinux-keyring || true
fi
sudo pacman-key --init || true
sudo pacman-key --populate archlinux || true

sudo pacman -Syu --noconfirm

# ======== Pacotes base ========
sudo pacman -S --needed --noconfirm base-devel git curl wget unzip zip openssh zsh fontconfig gnupg

# ======== Git ========
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main

# ======== GitHub CLI ========
sudo pacman -S --needed --noconfirm github-cli

# ======== NVM + Node LTS ========
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi
if ! grep -q 'NVM_DIR' "$SHELL_RC"; then
  cat >> "$SHELL_RC" <<'EOF'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
EOF
fi
# shellcheck disable=SC1090
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
if ! command -v node >/dev/null 2>&1; then
  nvm install --lts
fi

# ======== asdf (opcional) ========
if [ "${INSTALL_ASDF}" = "1" ]; then
  if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
  fi
  if ! grep -q 'asdf.sh' "$SHELL_RC"; then
    printf '\n. "$HOME/.asdf/asdf.sh"\n. "$HOME/.asdf/completions/asdf.bash"\n' >> "$SHELL_RC"
  fi
  # Exemplo de plugins (descomente se quiser)
   . "$HOME/.asdf/asdf.sh"
   asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true
   asdf install nodejs latest
   asdf global nodejs latest
fi

# ======== Ruby via asdf ========
# Dependências para compilar Ruby no Arch
sudo pacman -S --needed --noconfirm openssl libffi zlib libyaml readline gdbm ncurses

# Garante ASDF carregado
. "$HOME/.asdf/asdf.sh"

# Plugin Ruby
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git || true
asdf plugin update ruby || true

# Versão estável mais recente
RUBY_LATEST="$(asdf latest ruby)"
asdf install ruby "$RUBY_LATEST"
asdf global ruby "$RUBY_LATEST"

# Gems padrão (opcional)
grep -qxF "bundler" "$HOME/.default-gems" 2>/dev/null || {
  printf "bundler\n" >> "$HOME/.default-gems"
}
asdf reshim ruby

# Verificação
ruby -v
gem -v

# ======== yay (AUR helper) ========
if ! command -v yay >/dev/null 2>&1; then
  tmp_dir="$(mktemp -d)"
  trap 'rm -rf "$tmp_dir"' EXIT
  sudo pacman -S --needed --noconfirm base-devel git
  git clone https://aur.archlinux.org/yay.git "$tmp_dir/yay"
  pushd "$tmp_dir/yay" >/dev/null
  makepkg -si --noconfirm
  popd >/dev/null
fi

# ======== Zsh padrão ========
if [ "${SHELL:-}" != "/bin/zsh" ] && command -v zsh >/dev/null 2>&1; then
  chsh -s /bin/zsh || true
fi

# ======== Powerlevel10k: fontes Meslo (opcional) ========
if [ "${INSTALL_P10K_FONTS}" = "1" ]; then
  sudo mkdir -p /usr/share/fonts/truetype
  pushd /usr/share/fonts/truetype >/dev/null
  sudo wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
  sudo wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
  sudo wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
  sudo wget -q https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
  sudo fc-cache -f
  popd >/dev/null
fi

echo
echo "OK. Abra um novo terminal ou rode: exec zsh"
