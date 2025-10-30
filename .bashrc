#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='lsd -hal'
# dotfiles kezelés
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lzd='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Variables
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# PS1='[\u@\h \W]\$ '

# Bash completion aktiválása
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Fzf kiegészítés és Ctrl+R parancselőzmény keresés aktiválása
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# Dotenv betöltése
if [ -f "$HOME/.env" ]; then
    export $(grep -v '^#' "$HOME/.env" | xargs)
fi

eval "$(starship init bash)"
