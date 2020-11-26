if command -v fd &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y fd-find

  # Config
  ln -sf "$BASEDIR"/bash_/fd.bash "$BASHDIR"/fd.bash
fi
