export FZF_DEFAULT_OPTS="
  --preview-window=hidden
  --preview ' \
      ([[ -d {} ]] && tree -aC  -L 2 --dirsfirst {} -I "".git|node_modules"") \
      || ([[ -f {} ]] && batcat --style=full --color=always {} || cat {}) \
      || echo {} \
      2> /dev/null | head -100'
  --height 60%
  --layout=reverse
  --border
  --multi
  --bind '?:toggle-preview'
  --bind 'ctrl-a:toggle-all'
  --bind 'ctrl-l:execute(less {})'
  --bind 'ctrl-y:execute-silent(echo {+} | xclip)'
  --bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
  --bind 'ctrl-v:execute(code {+} || codium {+})'
"

export FZF_DEFAULT_COMMAND="fdfind --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type d . $HOME"

source /usr/share/doc/fzf/examples/completion.bash
source /usr/share/doc/fzf/examples/key-bindings.bash

# ALIASES
alias fh='history | fzf --tac --no-sort'
alias fpath='echo $PATH | tr ":" "\n" | fzf'
alias fapt='apt-cache pkgnames \
  | fzf -m --preview \
    "cat <(\
      apt-cache show {1} \
      | grep --color -E \"^Package|^Homepage|^Version|^Size|^Description-en|^\"\
    )" \
    --preview-window "80" \
  | xargs -ro sudo apt install'

