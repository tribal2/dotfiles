# https://github.com/ajeetdsouza/zoxide
echo 'A smarter cd command. Supports all major shells.'
if command -v z &> /dev/null
then
  echo "Already installed!"
else
  sudo apt install -y zoxide
  zoxide init bash
fi
