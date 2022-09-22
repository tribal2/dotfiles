if command -v gitk &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y gitk

  # Add Git alias: git visual -> Execute gitk --all in a background process
  git config --global alias.visual '!gitk --all &'
fi
