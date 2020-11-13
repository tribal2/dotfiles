# https://github.com/antonmedv/fx

if command -v fx &> /dev/null
then
  echo "Already installed!"
else
  if ! command -v node &> /dev/null
  then
    echo "Error! Necesita tener instalado NodeJS."
  else
    sudo npm install -g fx
  fi
fi
