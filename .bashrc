#!/usr/bin/env bash

# Source global definitions
[[ -f /etc/bashrc ]] && \
    . /etc/bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

shopt -s checkwinsize # Check rows and columns before running command
shopt -s autocd # Change directories without writing cd

# History
shopt -s histappend 
PROMPT_COMMAND='history -a'

# PROMPT, Maybe move this to another file?
# Git branch
function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

# Check SSH
function check_ssh {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "@$HOSTNAME "
  fi
}

PROMPT_DIRTRIM=3
export PS1="\[\033[31m\]\$(check_ssh)\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \$ "

# ALIASES, maybe move this to another file?
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -la -h --color=auto --group-directories-first'
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias cs='git --git-dir=$HOME/.dotfiles --work-tree=$HOME status'
alias gs='git status'
# alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

alias fstp='nvim $HOME/.local/bin/fedora-setup.sh'

function add_note {
  note_location="$HOME/notes/$(date '+%Y%m%d')_note"
  echo -e "\n-- $(date '+%H:%M') -- " >> $note_location
  $EDITOR +% +start! "$note_location"
}

function continue_note {
  note_location="$HOME/notes/$(date '+%Y%m%d')_note"
  $EDITOR +% +start! "$note_location"
}

