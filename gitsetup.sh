#!/usr/bin/bash

sudo apt-get install -y git

echo
read -p 'Do you want to setup your user in Git? (y/n) ' -n 1 -r  < /dev/tty
echo
if [[ $REPLY =~ ^[Yy]$ ]] then
  # Name
  read -p "What's your name? " < /dev/tty
  git config --global user.name $REPLY
  echo

  # Email
  read -p "What's your email address? " < /dev/tty
  git config --global user.email $REPLY
  echo
fi

echo
read -p 'Do you want to setup autocorrect for Git commands? (y/n) ' -n 1 -r  < /dev/tty
echo
if [[ $REPLY =~ ^[Yy]$ ]] then
  git config --global help.autocorrect 20
fi

echo
read -p 'Do you want to setup aliases for some Git commands? (y/n) ' -n 1 -r  < /dev/tty
echo
if [[ $REPLY =~ ^[Yy]$ ]] then
    # git rev -> Revert all
  git config --global alias.rev 'checkout .'
  git config --global alias.fck = 'reset --hard'

  # git unstage -> Remove a file from staging
  git config --global alias.unstage 'reset HEAD --'

  # git last -> Info about last commit
  git config --global alias.last 'log -1 HEAD --stat'

  # git rv -> Show remote repos
  git config --global alias.rv 'remote -v'

  # git wip -> Stage and commit all changes as Work in Process
  git config --global alias.wip '!git add -A && git commit -m "chore: WIP"'

  # Push
  git config --global alias.p push
  git config --global alias.pa 'push --all'
  git config --global alias.pt 'push --tags'

  # History
  # git lp -> Pretty graph logs
  # https://pbs.twimg.com/media/FdGfcpLXgAAZCnm?format=jpg&name=large
  git config --global alias.lp 'log --oneline --graph --decorate=full --all'
  # git ll -> Oneline log
  git config --global alias.ll 'log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'

  # Other aliases
  git config --global alias.co checkout
  git config --global alias.br branch
  git config --global alias.c 'commit -m'
  git config --global alias.st 'status -sb'
  git config --global alias.d 'diff'

  # git gl -> Show all global configuration
  git config --global alias.gl 'config --global -l'
fi
echo

# Show all global configurations
git config --global -l
echo
