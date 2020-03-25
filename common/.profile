#!/usr/bin/env sh
# Profile file. Runs on login. 
export TERMINAL="st"
export SHELL="zsh"
export EDITOR="nvim"
export FILE="ranger"
export BROWSER="brave-browser"

export SUDO_ASKPASS="$HOME/bin/dmenupass"

export PATH="$PATH":~/bin:~/.local/bin

export WORKON_HOME=~/.virtual_envs

# ~/ Cleanup
export LESSHISTFILE="-"
