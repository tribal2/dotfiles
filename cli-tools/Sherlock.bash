# https://github.com/sherlock-project/sherlock

if [[ -d "$SRCDIR"/sherlock ]]
then
  echo "Already installed!"
else
  git clone https://github.com/sherlock-project/sherlock.git "$SRCDIR"/sherlock
  
  [[ $(python3 -m pip --version) ]] || sudo apt-get install -y python3-pip

  cd "$SRCDIR"/sherlock || exit
  python3 -m pip install -r requirements.txt
  cd "$HOME" || exit

  ln -sf "$BASEDIR"/bash_/sherlock.bash "$BASHDIR"/sherlock.bash
fi
