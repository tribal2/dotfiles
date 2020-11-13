#!/usr/bin/bash

echo
read -p 'Do you want to update your system? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get update -y
  sudo apt-get upgrade -y
fi

sudo apt-get install -y git

CONFDIR=$HOME/.config
BASHDIR=$CONFDIR/bash
SRCDIR=$HOME/src
BASEDIR=$SRCDIR/dotfiles

mkdir -p "$BASHDIR"
mkdir -p "$SRCDIR"

cd "$SRCDIR" || exit
git clone https://github.com/swordf1zh/dotfiles.git
cd "$HOME" || exit

rm "$HOME"/.bashrc
ln -s "$BASEDIR"/.bashrc "$HOME"/.bashrc
ln -s "$BASEDIR"/bash_/aliases.bash "$BASHDIR"/aliases.bash

echo
read -p 'Do you want to install Ubuntu Restricted Extras? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install ubuntu-restricted-extras
fi

# TERMINAL
# Alacritty
echo
read -p 'Do you want to install Alacritty? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo add-apt-repository ppa:mmstick76/alacritty
  sudo apt-get update -y
  sudo apt-get install -y alacritty

  # Font installation
  mkdir -p "$HOME"/.local/share/fonts
  cd "$HOME"/.local/share/fonts
  curl -fsSLo 'DejaVu Sans Mono Nerd Font.ttf' https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf
  cd

  # Config
  mkdir -p "$CONFDIR"/alacritty
  ln -s "$BASEDIR"/alacritty.yml "$CONFDIR"/alacritty/alacritty.yml
fi

# Starship
echo
read -p 'Do you want to install Starship? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  curl -fsSL https://starship.rs/install.sh | sudo bash

  ln -s "$BASEDIR"/starship.toml "$CONFDIR"/starship.toml
  ln -s "$BASEDIR"/bash_/starship.bash "$BASHDIR"/starship.bash
fi

# Ripgrep
echo
read -p 'Do you want to install Ripgrep? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install -y ripgrep
fi

# Fzf [https://github.com/junegunn/fzf]
echo
read -p 'Do you want to install FuzzyFinder (fzf)? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install -y fzf

  ln -s "$BASEDIR"/bash_/fzf.bash "$BASHDIR"/fzf.bash
fi

# Xclip
echo
read -p 'Do you want to install Xclip? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install -y xclip
fi

# Tmux
echo
read -p 'Do you want to install Tmux? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install -y tmux
fi

# Bat
echo
read -p 'Do you want to install Bat? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  #sudo apt-get install -y bat
  sudo apt-get -o Dpkg::Options::="--force-overwrite" install -y bat

  ln -s "$BASEDIR"/bash_/bat.bash "$BASHDIR"/bat.bash
fi

# Exa [https://github.com/ogham/exa]
echo
read -p 'Do you want to install Exa? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  curl -fLo /tmp/exa.zip \
    https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
  unzip /tmp/exa.zip -d /tmp
  rm /tmp/exa.zip
  sudo mv /tmp/exa-linux-x86_64 /usr/local/bin/exa

  sudo curl -fLo /usr/share/man/man1/exa.1 --create-dirs \
    https://raw.githubusercontent.com/ogham/exa/master/man/exa.1.md

  ln -s "$BASEDIR"/bash_/exa.bash "$BASHDIR"/exa.bash
fi

# TLDR (tealdeer) [https://github.com/dbrgn/tealdeer]
echo
read -p 'Do you want to install Tealdeer (tldr)? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo curl -fLo /usr/local/bin/tldr \
    https://github.com/dbrgn/tealdeer/releases/download/v1.4.1/tldr-linux-x86_64-musl
  sudo chmod +x /usr/local/bin/tldr
  tldr --update
  sudo curl -fLo /usr/share/bash-completion/completions/tldr \
    https://github.com/dbrgn/tealdeer/releases/download/v1.4.1/completions_bash
fi

# Googler
echo
read -p 'Do you want to install Googler? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get install -y googler
  curl -fLo "$CONFDIR"/bash/googler \
    https://raw.githubusercontent.com/jarun/googler/master/auto-completion/googler_at/googler_at

  ln -s "$BASEDIR"/bash_/googler.bash "$BASHDIR"/googler.bash
fi

# NEOVIM
# Instalación
echo
read -p 'Do you want to install Neovim? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo snap install nvim --beta --classic
  #sudo apt-get install -y neovim

  # Administrador de plugins para Neovim
  curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # Aplicamos configuraciones
  mkdir -p "$CONFDIR"/nvim
  ln -s "$BASEDIR"/init.vim "$CONFDIR"/nvim/init.vim

  # Neovim instalar plugins
  nvim -c :PlugInstall -c :q -c :q


  ln -s "$BASEDIR"/bash_/nvim.bash "$BASHDIR"/nvim.bash
fi

# POWERLINE FONTS
echo
read -p 'Do you want to install PowerlineFonts? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git clone https://github.com/powerline/fonts.git "$SRCDIR"/powerline-fonts
  sudo "$SRCDIR"/powerline-fonts/install.sh
fi

# FX [https://github.com/antonmedv/fx]
echo
read -p 'Do you want to install Fx JSON viewer? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  #@todo 0 Instalar Node
  sudo npm install -g fx
fi

# SHERLOCK [https://github.com/sherlock-project/sherlock]
echo
read -p 'Do you want to install Sherlock? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git clone https://github.com/sherlock-project/sherlock.git "$SRCDIR"/sherlock
  cd "$SRCDIR"/sherlock || exit
  sudo apt-get install -y python3-pip
  python3 -m pip install -r requirements.txt
  cd "$HOME" || exit

  ln -s "$BASEDIR"/bash_/sherlock.bash "$BASHDIR"/sherlock.bash
fi

sudo apt-get autoremove -y
source "$HOME"/.bashrc
