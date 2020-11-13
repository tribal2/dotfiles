if command -v googler &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y googler
  curl -fLo "$CONFDIR"/bash/googler \
    https://raw.githubusercontent.com/jarun/googler/master/auto-completion/googler_at/googler_at

  ln -sf "$BASEDIR"/bash_/googler.bash "$BASHDIR"/googler.bash
fi
