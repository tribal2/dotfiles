if command -v chromium &> /dev/null
then
  echo "Already installed!"
else
  sudo apt install -y chromium-browser
fi
