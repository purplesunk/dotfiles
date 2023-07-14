#!/usr/bin/env bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Profile file. Runs on login. Environmental variables are set here.
# Adds `~/.local/bin` to $PATH
PATH="$PATH:/usr/local/bin:/home/$USER/.local/bin"

export EDITOR=nvim
export BROWSER=firefox

if [ "$OSTYPE" = "linux-gnu" ]; then
	. "$HOME"/.config/cleanup
fi
