# https://github.com/sherlock-project/sherlock

if [[ -f "$BASHDIR"/sherlock.bash ]]
then
  echo "Already installed!"
else
  ln -sf "$BASEDIR"/bash_/sherlock.bash "$BASHDIR"/sherlock.bash
fi
