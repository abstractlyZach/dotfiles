#!/usr/bin/env sh
# Profile file. Runs on login. 
export TERMINAL="st"
export SHELL="zsh"

export PATH="$PATH":~/bin

# start virtualenvwrapper
source ~/.local/bin/virtualenvwrapper.sh

export WORKON_HOME=~/.virtual_envs
