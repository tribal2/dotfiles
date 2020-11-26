if command -v tree &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y tree
fi
