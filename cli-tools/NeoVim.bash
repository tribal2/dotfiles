if command -v nvim &> /dev/null
then
  echo "Already installed!"
else
  sudo snap install nvim --beta --classic
  #sudo apt-get install -y neovim

  # Plugin admin
  curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # Plugin install
  nvim -c :PlugInstall -c :q -c :q

  # Config
  mkdir -p "$CONFDIR"/nvim
  ln -sf "$BASEDIR"/init.vim "$CONFDIR"/nvim/init.vim

  # Alias (vim = nvim)
  ln -sf "$BASEDIR"/bash_/nvim.bash "$BASHDIR"/nvim.bash
fi
