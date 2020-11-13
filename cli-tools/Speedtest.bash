if command -v speedtest &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y gnupg1 apt-transport-https dirmngr
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
  echo \
    "deb https://ookla.bintray.com/debian generic main" \
    | sudo tee  /etc/apt/sources.list.d/speedtest.list
  sudo apt-get update -y
  sudo apt-get install -y speedtest
fi
