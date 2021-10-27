if command -v zathura &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get intall -y zathura

  # Config
  mkdir -p "$CONFDIR"/zathura
  ln -sf "$BASEDIR"/cfg/zathura.conf "$CONFDIR"/zathura/zathurarc
fi
