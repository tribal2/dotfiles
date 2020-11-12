if [ "$(command -v batcat)" ]; then
  alias bat='batcat'
  alias cat='batcat -pp'

  battail() {
    tail -f $1 | batcat --paging=never -l log
  }

fi
