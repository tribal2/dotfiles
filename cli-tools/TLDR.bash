# https://github.com/dbrgn/tealdeer

if command -v tldr &> /dev/null
then
  echo "Already installed!"
else
  # Bin
  sudo curl -fLo /usr/local/bin/tldr \
    https://github.com/dbrgn/tealdeer/releases/download/v1.4.1/tldr-linux-x86_64-musl
  sudo chmod +x /usr/local/bin/tldr

  # Cache update
  tldr --update

  # Bash autocompletions
  sudo curl -fLo /usr/share/bash-completion/completions/tldr \
    https://github.com/dbrgn/tealdeer/releases/download/v1.4.1/completions_bash
fi
