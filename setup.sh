#!/usr/bin/bash

# SYSTEM UPDATE
echo
read -p 'Do you want to update your system? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo apt-get update -y
  sudo apt-get upgrade -y
fi

# TIMEZONE
echo
echo 'These are your actual time settings:'
timedatectl
echo
read -p 'Do you want to change your system timezone? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  read -p 'Time zone (eg: America/Panama): '
  if [[ ! -z $REPLY ]]
  then
    sudo timedatectl set-timezone $REPLY
    echo 'These are your new time settings:'
    timedatectl
  fi
  echo
fi

# GIT install
if ! command -v git &> /dev/null
then
  sudo apt-get install -y git
fi

# DIRNAMES
CONFDIR=$HOME/.config
BASHDIR=$CONFDIR/bash
SRCDIR=$HOME/src
BASEDIR=$SRCDIR/dotfiles

# DIR CREATION
mkdir -p "$BASHDIR"
mkdir -p "$SRCDIR"

# DOTFILES REPO
cd "$SRCDIR" || exit
[[ -d dotfiles ]] || git clone https://github.com/swordf1zh/dotfiles.git
cd "$HOME" || exit

#    ╔═╗┌─┐┌─┐┌┬┐┬ ┬┌─┐┬─┐┌─┐
#    ╚═╗│ │├┤  │ │││├─┤├┬┘├┤
#    ╚═╝└─┘└   ┴ └┴┘┴ ┴┴└─└─┘
echo
read -p 'Do you want to install software? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cat <<EOF
    ╔═╗┌─┐┌─┐┌┬┐┬ ┬┌─┐┬─┐┌─┐
    ╚═╗│ │├┤  │ │││├─┤├┬┘├┤
    ╚═╝└─┘└   ┴ └┴┘┴ ┴┴└─└─┘
EOF

  for FILEPATH in "$BASEDIR"/software/*.bash;
  do
    FILENAME=$(basename -- "$FILEPATH")
    EXTENSION="${FILENAME##*.}"
    FILE="${FILENAME%.*}"
    echo
    read -p "Do you want to install $FILE? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      source "$FILEPATH"
    fi
  done

  sudo apt-get autoremove -y
fi

#   ╔═╗╦  ╦  ┌┬┐┌─┐┌─┐┬  ┌─┐
#   ║  ║  ║   │ │ ││ ││  └─┐
#   ╚═╝╩═╝╩   ┴ └─┘└─┘┴─┘└─┘
echo
read -p 'Do you want to install CLI-tools? (y/n) ' -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cat <<EOF
    ╔═╗╦  ╦  ┌┬┐┌─┐┌─┐┬  ┌─┐
    ║  ║  ║   │ │ ││ ││  └─┐
    ╚═╝╩═╝╩   ┴ └─┘└─┘┴─┘└─┘
EOF

  for FILEPATH in "$BASEDIR"/cli-tools/*.bash;
  do
    FILENAME=$(basename -- "$FILEPATH")
    EXTENSION="${FILENAME##*.}"
    FILE="${FILENAME%.*}"
    echo
    read -p "Do you want to install $FILE? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      source "$FILEPATH"
    fi
  done

  sudo apt-get autoremove -y
fi

ln -sf "$BASEDIR"/bash_/aliases.bash "$BASHDIR"/aliases.bash
ln -sf "$BASEDIR"/bash_/docker.bash "$BASHDIR"/docker.bash
ln -sf "$BASEDIR"/.bashrc "$HOME"/.bashrc
source "$HOME"/.bashrc
