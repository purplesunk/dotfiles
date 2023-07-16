#!/usr/bin/env bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Profile file. Runs on login. Environmental variables are set here.
# Adds `~/.local/bin` to $PATH
PATH="$PATH:/usr/local/bin:/home/$USER/.local/bin"

export EDITOR=nvim
export BROWSER=firefox
export NOTES_DIR="$HOME"/notes

export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

# Clean up home:
# NEWSBOAT NEEDS:
# mkdir -p "$XDG_DATA_HOME"/newsboat "$XDG_CONFIG_HOME"/newsboat

# WINE NEEDS:
[[ ! -d "$XDG_DATA_HOME"/wineprefixes ]] && mkdir -p "$XDG_DATA_HOME"/wineprefixes
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default

# NVIDIA NEEDS:
# export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv 

# BASH AND BASH COMPLETION:
[[ ! -d "$XDG_STATE_HOME"/bash ]] && mkdir -p "$XDG_STATE_HOME"/bash
export HISTFILE="$XDG_STATE_HOME"/bash/history
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion

# GTK:
# export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# XORG THINGS:
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
# export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
# export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
# export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
