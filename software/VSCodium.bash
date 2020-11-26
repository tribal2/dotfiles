if command -v codium &> /dev/null
then
  echo "Already installed!"
else
  # Add the GPG key of the repository
  wget \
    -qO - \
    https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg

  # Add the repository
  echo \
    'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' \
    | sudo tee --append /etc/apt/sources.list.d/vscodium.list

  # Update and install
  sudo apt-get update -y
  sudo apt-get install -y codium
fi
