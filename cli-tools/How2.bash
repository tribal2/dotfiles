# https://github.com/santinic/how2

if command -v how2 &> /dev/null
then
  echo "Already installed!"
else
  # Bin
  curl -fLo /tmp/how2.deb \
    https://github.com/santinic/how2/releases/download/v3.0.0-beta/how2.deb

  sudo dpkg i /tmp/how2.deb
fi
