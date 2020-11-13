if command -v starship &> /dev/null
then
  echo "Already installed!"
else
  curl -fsSL https://starship.rs/install.sh | sudo bash

  ln -sf "$BASEDIR"/starship.toml "$CONFDIR"/starship.toml
  ln -sf "$BASEDIR"/bash_/starship.bash "$BASHDIR"/starship.bash
fi
