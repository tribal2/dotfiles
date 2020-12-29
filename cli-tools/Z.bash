# https://github.com/rupa/z
echo 'Z (jump around). Tracks your most used directories, based on "frecency".'
if command -v z &> /dev/null
then
  echo "Already installed!"
else
  git clone https://github.com/rupa/z.git "$SRCDIR"/z
  ln -sf "$SRCDIR"/z/z.sh "$BASHDIR"/z.bash
fi
