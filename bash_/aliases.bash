#!/usr/bin/bash

alias c="clear"
alias h='history'
alias hg='history | grep -i'
alias :q="exit"
alias ..="cd .."

alias dev="cd ~/dev"

alias findx="find $HOME -iname"
alias follow="tail -f -n +1"
alias biggest="du -h --max-depth=1 | sort -h"
alias sizes="du -shc"

alias sha1='openssl sha1'
alias pingg="ping 8.8.8.8"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# update on one command
alias update='sudo apt-get update -y \
  && sudo apt-get upgrade -y \
  && sudo apt-get autoremove'

# become root #
alias root='sudo -i'
alias su='sudo -i'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Go to manpage parameter description (eg: $ mans ls -l)
function mans {
  man $1 | less -p "^ +$2"
}
