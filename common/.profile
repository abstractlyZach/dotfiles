#!/usr/bin/env sh
# Profile file. Runs on login. 
export TERMINAL="st"
export SHELL="zsh"
export EDITOR="kak"
export FILE="lf"
export BROWSER="brave"

export SUDO_ASKPASS="$HOME/bin/dmenupass"

export PATH="$PATH":~/bin:~/.local/bin

# ~/ Cleanup
export LESSHISTFILE="-"
export GNUPGHOME="$HOME/.config/gnupg/"
export IPYTHONDIR="$HOME/.config/ipython"

export XDG_CONFIG_HOME="$HOME/.config"
