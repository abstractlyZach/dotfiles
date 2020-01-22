#!/usr/bin/env sh
# Profile file. Runs on login. 
export TERMINAL="st"
export SHELL="zsh"
export EDITOR="nvim"
export FILE="ranger"
export BROWSER="firefox"

export PATH="$PATH":~/bin

unamestr=$(uname)
if [[ "$unamestr" == "Ubuntu" ]]; then
	# start virtualenvwrapper
	source ~/.local/bin/virtualenvwrapper.sh
fi

export WORKON_HOME=~/.virtual_envs
