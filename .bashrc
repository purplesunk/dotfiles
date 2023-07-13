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

shopt -s autocd # cd into directory just by typing the directory name.

# prompt
RED="\033[0;31m"
GREEN="\033[0;32m"
ORANGE="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
LGRAY="\033[0;37m"
NC="\033[0m"
export PS1="\[${PURPLE}\]\u\[${NC}\]\[${ORANGE}\]@\[${NC}\]\[${BLUE}\]\h\[${NC}\] \[${GREEN}\]\w\[${NC}\] \[${ORANGE}\]\$\[${NC}\] "

# HISTORY THINGY:
shopt -s histappend
PROMPT_COMMAND='history -a'

#aliases
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -la -h --color=auto --group-directories-first'
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias nvidia-settings='nvidia-settings --config="$HOME_CONFIG_HOME"/nvidia/settings'

alias fstp='nvim $HOME/.local/bin/fedora-setup.sh'

unset rc
