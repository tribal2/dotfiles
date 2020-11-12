if [ "$(command -v exa)" ]; then
    unalias 'll'
    unalias 'ls'
    alias ls='exa -Ga --group-directories-first --color auto --icons -s type'
    alias ll='exa -laagh --group-directories-first --color always --color-scale --icons -s type'

    ltree() {
      if [ -z $1 ]; then
        echo "Debe especificar un valor numérico para la profundidad del árbol. (Usando un valor de 1 por defecto)"
        PROF=1
      else
        PROF=$1
      fi

      exa -agh -T -L $PROF $2
    }
fi
