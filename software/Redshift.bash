if command -v redshift &> /dev/null
then
  echo "Already installed!"
else
  sudo apt-get install -y redshift-gtk

  # Config
  mkdir -p "$CONFDIR"/redshift
  ln -sf "$BASEDIR"/cfg/redshift.conf "$CONFDIR"/redshift/redshift.conf
fi
