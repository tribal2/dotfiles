# https://github.com/ogham/exa

if command -v exa &> /dev/null
then
  echo "Already installed!"
else
  # Bin
  curl -fLo /tmp/exa.zip \
    https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
  unzip /tmp/exa.zip -d /tmp
  rm /tmp/exa.zip
  sudo mv /tmp/exa-linux-x86_64 /usr/local/bin/exa

  # Manpage
  sudo curl -fLo /usr/share/man/man1/exa.1 --create-dirs \
    https://raw.githubusercontent.com/ogham/exa/master/man/exa.1.md

  # Config
  ln -sf "$BASEDIR"/bash_/exa.bash "$BASHDIR"/exa.bash
fi
