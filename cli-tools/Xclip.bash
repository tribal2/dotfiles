if command -v xclip &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y xclip
fi
