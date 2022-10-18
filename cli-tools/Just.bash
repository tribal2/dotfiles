# https://github.com/casey/just

if command -v just &> /dev/null
then
  echo "Already installed!"
else
  # You must have the Prebuilt-MPR set up on your system in order to run this command.
  # https://docs.makedeb.org/prebuilt-mpr/getting-started/#setting-up-the-repository
  sudo apt install just
fi
