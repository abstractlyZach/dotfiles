#!/usr/bin/env sh
# Profile file. Runs on login.

# open terminal using a certain command
export TERMINAL="alacritty -e"
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

[ $(uname) = 'Darwin' ] && export CLIPBOARD="pbcopy"
[ $(uname) = 'Linux' ] && export CLIPBOARD="wl-copy"
