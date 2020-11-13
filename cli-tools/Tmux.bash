if command -v tmux &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y tmux
fi
