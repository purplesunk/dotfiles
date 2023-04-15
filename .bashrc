#!/bin/bash
# ~/.bashrc

# Source global definitions
[[ -f /etc/bashrc ]] && \
  . /etc/bashrc

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# vi like editing
set -o vi
set show-mode-in-prompt on
set vi-cmd-mode-string "\e[2 q"
set vi-ins-mode-string "\e[6 q"
shopt -s autocd # cd into directory just by typing the directory name.

# prompt
export PS1="\[$(tput bold)\]\[\033[38;5;137m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;136m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;136m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

# HISTORY THINGY:
shopt -s histappend
PROMPT_COMMAND='history -a'

#aliases
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -la -h --color=auto --group-directories-first'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias nvidia-settings='nvidia-settings --config="$HOME_CONFIG_HOME"/nvidia/settings'
alias daditosbb='cd /home/nach/Documents/universidad/utn-lab-01/lab-01-dados-diez-mil'

alias fstp='nvim $HOME/.local/bin/fedora-setup.sh'

unset rc
