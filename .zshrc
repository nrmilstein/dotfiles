# Plugins for oh-my-zsh to use
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(fancy-ctrl-z safe-paste jsontools zsh-syntax-highlighting zsh-autosuggestions)

# load oh-my-zsh
source ~/.zshsetup

# set ls colors for MacOS `ls` utility (only change from default is yellow directories)
export LSCOLORS=dxfxcxdxbxegedabagacad 
#
# set custom colors for `exa` (our preferred `ls` utility), `tree`, etc.
#export LS_COLORS='di=38;5;69:ln=35:so=32:ex=31:sn=38;5;97:sb=38;5;240:uu=38;5;240:un=38;5;237:da=38;5;245'
source ~/.zsh_lscolors

# make zsh like vim
#source ~/.zshvim

# load z directory utility
. `brew --prefix`/etc/profile.d/z.sh

# use colors in less
export LESS=-Ri

# set EDITOR and VISUAL environment variables
export VISUAL=nvim
export EDITOR="$VISUAL"

# exa configuration
export EXA_COLORS=$LS_COLORS
alias ls='exa -a'
alias l='exa --git -la'
alias le='exa -a --sort=extension'
alias lle='exa --git -la --sort=extension'
alias lda='exa -a --sort=date'
alias llda='exa --git -la --sort=date'
alias lr='exa -aR'
alias lt='exa -aT'
alias sl='ls '

# ls aliases (no longer used, exa used instead)
#alias ls='ls -AG'
#alias l='ls -lAh'
#alias ll='ls -lAh'
#alias la='ls -lAh'
#alias lr='ls -AR'

# convenience aliases
alias s="sudo "
alias sudo="sudo " # space on end makes sudo expand aliases
alias v="nvim"
alias sv="sudo nvim"
alias m="mate"
alias x="exit"
alias o="open"
alias g='git'
alias gs='git status'
alias vip="nvim -p" # open files in vim tabs
alias amp="amplify"
alias tf="terraform"

# shortcuts
alias flush="dscacheutil -flushcache" # needed sometimes after updating hosts file
alias btr='killall BetterTouchTool; sleep 1; open -a BetterTouchTool' # restart BetterTouchTool

# Basic command modifications
alias vim='nvim '
alias vimdiff='nvim -d '
alias 'gdb'='gdb -silent'
alias tree='tree -a'
alias cat='bat --paging=never --style=numbers --theme TwoDark' # use `bat` instead of `cat`
alias fd='fd --hidden --exclude ".git/"' # search hidden files with `fd`, exclude .git
alias http='http --style monokai '
alias https='https --style monokai '

# python aliases. Always use python 3
alias python="python3"
alias p3="python3"
alias pip="pip3"

# aliases so that haskell uses stack
alias ghc='stack ghc'
alias ghci='stack ghci --verbosity warn'
alias runghc='stack runghc'

# git aliases for loading diff and log in vim
alias 'gdv'='git diff | nvim -c "set filetype=git" -'
alias 'gdvc'='git diff --cached | nvim -c "set filetype=git" -'
alias 'glv'='git log -p | nvim -c "set filetype=git" -'
alias 'glvc'='git log -p --cached | nvim -c "set filetype=git" -'

# convenient directory navigation aliases
alias -- "-"="cd - "
alias ..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'

# zsh settings
#unsetopt correct_all
unsetopt sharehistory
unsetopt case_glob

# make ctrl-u delete everything before the cursor instead of the whole line
bindkey \^U backward-kill-line

# make ctrl-p behave the same as up-arrow
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# prevent zsh from eating the space before a pipe
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'

# color man pages
man () {
  LESS_TERMCAP_mb=$'\e'"[1;31m" \
  LESS_TERMCAP_md=$'\e'"[1;31m" \
  LESS_TERMCAP_me=$'\e'"[0m" \
  LESS_TERMCAP_se=$'\e'"[0m" \
  LESS_TERMCAP_so=$'\e'"[1;44;33m" \
  LESS_TERMCAP_ue=$'\e'"[0m" \
  LESS_TERMCAP_us=$'\e'"[1;32m" \
  command man "$@"
}

# function that opens man pages in sublime text
sman() {
  man "${1}" | col -b | open -f -a Sublime\ Text
}
#
# Launch fzf, open the selected file in vim
function fzf {
  file=$(command fzf --height 60% --reverse "$@")
  [[ ! -z $file ]] && nvim $file
}

# Same as fzf but with preview
function fzfp {
  file=$(command fzf --height 60% --reverse --preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window down:noborder "$@")
  [[ ! -z $file ]] && nvim $file
}


# set ANDROID_HOME and add it to the path for Android SDK dev
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# add cargo (Rust's package manager) to path
export PATH=$PATH:~/.cargo/bin

# add CUDA to the path
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib

# set GOPATH (packages directory for go)
export GOPATH=$HOME/.go

# Add python user install directory to path
export PATH=$PATH:$(python -m site --user-base)/bin

# Don't change the prompt when activating python venv
export VIRTUAL_ENV_DISABLE_PROMPT=1

# init rbenv
eval "$(rbenv init -)"

# Set default command for `fzf`
export FZF_DEFAULT_COMMAND=fd
