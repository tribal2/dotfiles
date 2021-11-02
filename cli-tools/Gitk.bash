if command -v gitk &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y gitk
fi
