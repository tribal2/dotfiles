export FZF_DEFAULT_OPTS="
  --preview ' \
    ([[ -d {} ]] && tree -C {}) \
    || ([[ -f {} ]] && bat --style=full --color=always {}) \
    || echo {}'
  --height 60%
  --layout=reverse
  --border"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

source /usr/share/doc/fzf/examples/completion.bash
source /usr/share/doc/fzf/examples/key-bindings.bash

alias fh='history | fzf --tac --no-sort'
alias fapt='apt-cache pkgnames | fzf -m --preview "cat <(apt-cache show {1} | grep --color -E \"^Package|^Homepage|^Version|^Size|^Description-en|^ \")" --preview-window "80" | xargs -ro sudo apt install'
