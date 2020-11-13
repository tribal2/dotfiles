if command -v batcat &> /dev/null
then
  echo "Already installed!"
else
  #sudo apt-get install -y bat
  sudo apt-get -o Dpkg::Options::="--force-overwrite" install -y bat

  ln -sf "$BASEDIR"/bash_/bat.bash "$BASHDIR"/bat.bash
fi
