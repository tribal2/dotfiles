eval "$(starship init bash)"

function set_win_title(){
  echo -ne "\033]0; $PWD \007" | sed "s|/$HOME|~|" | sed "s|/| / |g"
}

starship_precmd_user_func="set_win_title"
