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
# export PS1="\[$(tput bold)\]\[\033[38;5;137m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;136m\]>\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;136m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
# export PS1="\e[35m\]\u\e[m\] \e[34m\]\W\e[m\] \e[31m\]󰘧\e[m\] " 
# export PS1="> "

# HISTORY THINGY:
shopt -s histappend
PROMPT_COMMAND='history -a'

#aliases
alias ls='ls -h --color=auto --group-directories-first'
alias ll='ls -la -h --color=auto --group-directories-first'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias nvidia-settings='nvidia-settings --config="$HOME_CONFIG_HOME"/nvidia/settings'

alias fstp='nvim $HOME/.local/bin/fedora-setup.sh'

unset rc
