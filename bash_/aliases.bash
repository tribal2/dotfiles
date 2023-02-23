#!/usr/bin/bash

#-------------------------------------------------------------------------------
# SO
#-------------------------------------------------------------------------------

alias c="clear"
alias cdc="cd ~; clear;"
alias h='history'
alias hg='history | grep -i'
alias :q="exit"

# Reloads the bash configuration file. This is useful if you have made changes to your bash profile and need to reload it without logging out and logging back in
alias reload='source ~/.bashrc'

# Confirmation #
Alias mv='mv -i'
alias cp='cp -ip'
alias ln='ln -i'

# Update on one command
alias update='sudo apt-get update -y \
  && sudo apt-get upgrade -y \
  && sudo apt-get autoremove'

# Shows the process tree
alias process='ps aux'

# Become root #
alias root='sudo -i'
alias su='sudo -i'

# Shows all directories in the PATH variable, one per line.
alias path='echo -e ${PATH//:/\\n}'

# Show the current kernel version
alias kernel='uname -r'

# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


#-------------------------------------------------------------------------------
# SO Resources
#-------------------------------------------------------------------------------

# Shows the amount of free and used memory in the system in a human-readable format.
alias free='free -m -h'

# Shows disk usage in a human-readable format
alias dfh='df -h'


#-------------------------------------------------------------------------------
# File operations
#-------------------------------------------------------------------------------
# This encrypts a file using AES-256 encryption
alias encrypt='function _encrypt() { openssl enc -aes-256-cbc -salt -in $1 -out $2; }; _encrypt'

# This decrypts a file that was encrypted using AES-256 encryption
alias decrypt='function _decrypt() { openssl enc -d -aes-256-cbc -in $1 -out $2; }; _decrypt'


#-------------------------------------------------------------------------------
# Directory operations
#-------------------------------------------------------------------------------

alias ll='ls -lahvF --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias follow="tail -f -n +1"
# Recursively find files in home directory and subdirectories by name
alias findx="find $HOME -iname"
# Recursively searches for a specified string in all files in the current directory and its subdirectories, excluding version control directories
alias search='function _search() { grep -r --exclude-dir={.git,.svn} $1 *; }; _search'

# Navigate up..
# ..one directory level
alias ..='cd ..'
# ..two directory levels
alias ...='cd ../..'
# Navigate to a directory and list the files in it with a single command and also show the directory tree
alias to='function _to() { cd "$@" && tree; }; _to'

# Shows the size of the current directory and its subdirectories in human-readable format
alias du1='du -h -d 1'
alias biggest="du -h --max-depth=1 | sort -h"
alias sizes="du -shc"

# Show all files sorted by modification date, the most recent first.
alias lr='ls -ltr'

# Creates a tarball of the current directory, compressed with gzip, with the filename in the format yyyymmdd.tar.gz.
alias backup='tar -zcvf $(date +%Y%m%d).tar.gz *'
# Extracts all files in the current directory with the .gz extension
alias extract='for i in *.gz; do tar xvf $i; done'

# Show a tree-like structure of the current directory, with directories being shown first.
alias tree='tree -C --dirsfirst'

# Renames all files in the current directory containing a specific string with another string
alias rename='function _rename() { for i in *$1*; do mv "$i" "${i/$1/$2}"; done }; _rename'

# This adds a progress bar and verbose output to rsync the command, which is more efficient than cp when copying a large number of files over a network.
alias cp='rsync --progress -avz --ignore-existing'


#-------------------------------------------------------------------------------
# Utilities
#-------------------------------------------------------------------------------

alias sha1='openssl sha1'

# Go to manpage parameter description (eg: $ mans ls -l)
alias mans='function _mans { man $1 | less -p "^ +$2"; }; _mans'

# Shows the current date in the format of "Day of the week, Month Day, Year"
alias today='date +"%A, %B %d, %Y"'

# Shows the weather for your system location using the wttr.in service
alias weather='function _weather() { curl wttr.in/$1; }; _weather'

# Pretty prints JSON file
alias jsonpretty='function _jsonpretty() { python -m json.tool $1; }; _jsonpretty'


#-------------------------------------------------------------------------------
# Network
#-------------------------------------------------------------------------------

alias pingg="ping 8.8.8.8"
alias pingc="ping 1.1.1.1"

# Show all open ports and the processes using them.
alias ports='netstat -a | grep -i "listen"'

# Shows your public IP address
alias publicip='curl ifconfig.me'


#-------------------------------------------------------------------------------
# My own aliases
#-------------------------------------------------------------------------------

alias dev="cd ~/dev"

# Find-in-file - usage: fif <SEARCH_TERM>
fif() {
  if [ ! "$#" -gt 0 ];
  then
    echo "Need a string to search for!";
    return 1;
  fi

  # @TODO: use grep if rg is not available
  if command -v rg &> /dev/null
  then
    rg --files-with-matches --no-messages "$1" \
      | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$1' {}"
  fi
}
