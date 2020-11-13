if command -v rg &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y ripgrep
fi
