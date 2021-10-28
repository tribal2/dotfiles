#!/usr/bin/bash

# .bashrc
cd
mv .bashrc{,.bak}
mv .bash_aliases{,.bak}

curl https://raw.githubusercontent.com/tribal2/dotfiles/master/.bashrc --output .bashrc
curl https://raw.githubusercontent.com/tribal2/dotfiles/master/bash_/aliases.bash --output .bash_aliases

source .bashrc
