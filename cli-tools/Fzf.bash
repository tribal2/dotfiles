# https://github.com/junegunn/fzf

if command -v fzf &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y fzf

  ln -sf "$BASEDIR"/bash_/fzf.bash "$BASHDIR"/fzf.bash
fi

# https://github.com/wfxr/forgit.git
if [[ ! -d "$SRCDIR"/forgit ]]
then
  read -p 'Do you want to install Forgit (a utility tool powered by fzf for using git interactively)? (y/n) ' -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    git clone https://github.com/wfxr/forgit.git "$SRCDIR"/forgit
    ln -sf "$SRCDIR"/forgit/forgit.plugin.sh "$BASHDIR"/forgit.bash
  fi
fi
