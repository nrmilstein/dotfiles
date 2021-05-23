export PS1="\[\e[0;36m\]\u\[\e[m\] \[\e[0;32m\]\w $ \[\e[m\]"
export CLICOLOR=1 # Colored output from 'ls'
export LSCOLORS=dxfxcxdxbxegedabagacad # Sets ls colors (only change from default is yellow directories)

# Add Mysql path
export PATH=/usr/local/mysql/bin:$PATH

# Add MacPorts path
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Add /usr/local path
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Set bash editor mode to vi
#set -o vi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Unhide ~/Library folder
#chflags nohidden Library

# Some helpful aliases
alias s="sudo "
alias sudo="sudo " # Causes sudo to expand aliases
alias 'ls'='ls -A'
alias 'gdb'='gdb -silent'
alias flush="dscacheutil -flushcache"
alias v="vim"
alias sv="sudo vim"
alias m="mate"
alias x="exit"
alias o="open"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
alias ......="cd ../../../../../.."
alias .......="cd ../../../../../../.."

export EDITOR="/usr/bin/vim"

