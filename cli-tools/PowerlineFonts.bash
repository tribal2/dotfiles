if [[ -d "$SRCDIR"/powerline-fonts ]]
then
  echo "Already installed!"
else
  git clone https://github.com/powerline/fonts.git "$SRCDIR"/powerline-fonts
  sudo "$SRCDIR"/powerline-fonts/install.sh
fi
