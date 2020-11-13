if command -v alacritty &> /dev/null
then
  echo "$CONFDIR"
  echo "Already installed!"
else
  sudo add-apt-repository ppa:mmstick76/alacritty
  sudo apt-get update -y
  sudo apt-get install -y alacritty

  # Font installation
  mkdir -p "$HOME"/.local/share/fonts
  cd "$HOME"/.local/share/fonts
  curl -fsSLo 'DejaVu Sans Mono Nerd Font.ttf' https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf
  cd "$HOME" || exit

  # Config
  mkdir -p "$CONFDIR"/alacritty
  ln -sf "$BASEDIR"/alacritty.yml "$CONFDIR"/alacritty/alacritty.yml
fi
