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
  [[ $(git status --porcelain 2> /dev/null) ]] && echo -n "*"
}
function parse_git_branch {
  git branch --no-color --format=%\(refname:short\) 2> /dev/null | sed -e "s/\(.*\)/ (\1$(parse_git_dirty))/"
}

#PROMPT_DIRTRIM=3
export PS1="\[\033[35m\]\u\[\033[31m\]@\h \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \$ "

# ALIASES, maybe move this to another file?
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -la -h --color=auto --group-directories-first'
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias cs='git --git-dir=$HOME/.dotfiles --work-tree=$HOME status'
alias gs='git status'
# alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

alias fstp='nvim $HOME/.local/bin/fedora-setup.sh'

[[ -z "$NOTES_DIR" ]] && export NOTES_DIR="$HOME"/notes
[[ -z "$EDITOR" ]] && export EDITOR=nvim

function add_note {
  if [ ! -f "$NOTES_DIR/$(date '+%Y%m%d')_note" ]; then
    echo -e "# $(date '+%A %d of %B of %Y')" >> "$NOTES_DIR/$(date '+%Y%m%d')_note.md"
  fi

  echo -e "\n## Time: $(date '+%H:%M')\n## Title: " >> "$NOTES_DIR/$(date '+%Y%m%d')_note.md"
  $EDITOR +% +start! "$NOTES_DIR/$(date '+%Y%m%d')_note.md"
}

function continue_note {
  $EDITOR +% +start! "$NOTES_DIR/$(date '+%Y%m%d')_note.md"
}

alias an='add_note'
alias cn='continue_note'

set -o vi
