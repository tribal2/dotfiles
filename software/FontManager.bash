if command -v font-manager &> /dev/null
then
  echo "Already installed!"
else
  sudo add-apt-repository -y ppa:font-manager/staging
  sudo apt-get update -y
  sudo apt-get install -y font-manager
fi
