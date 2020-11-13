# https://github.com/junegunn/fzf

if command -v fzf &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y fzf

  ln -sf "$BASEDIR"/bash_/fzf.bash "$BASHDIR"/fzf.bash
fi
