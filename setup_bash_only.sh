#!/usr/bin/bash

BACKUP_TAG=.bak_$(date +\%y\%m\%d)

echo 'Backing up actual .bashrc and .bash_aliases...'
cd
mv .bashrc{,$BACKUP_TAG}
mv .bash_aliases{,$BACKUP_TAG}

echo 'Downloading Bash config files from tribal2/dotfiles...'
curl https://raw.githubusercontent.com/tribal2/dotfiles/master/.bashrc \
  --silent \
  --output .bashrc
curl https://raw.githubusercontent.com/tribal2/dotfiles/master/bash_/aliases.bash \
  --silent \
  --output .bash_aliases

echo 'Sourcing new Bash files...'
source .bashrc

echo 'Bash setup done!'
