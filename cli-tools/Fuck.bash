# https://github.com/nvbn/thefuck

if command -v fuck &> /dev/null
then
  echo "Already installed!"
else
  sudo apt install python3-dev python3-pip python3-setuptools
  sudo pip3 install thefuck

  # Config
  ln -sf "$BASEDIR"/bash_/fuck.bash "$BASHDIR"/fuck.bash
fi
