#!/usr/bin/env sh
# Profile file. Runs on login.

# open terminal using a certain command
export TERMINAL="foot"

# make sure this is an absolute path. The shell is one of the first things to run and 
# some scripts build around that assumption, so they won't check the PATH.
export SHELL="/usr/bin/zsh"

export EDITOR="kak"
export FILE="lf"
export BROWSER="google-chrome-stable --enable-features=UseOzonePlatform --ozone-platform=wayland"

export SUDO_ASKPASS="$HOME/bin/dmenupass"


# my bin comes first
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/workspace/kcr/bin"

# ~/ Cleanup
export LESSHISTFILE="-"
export GNUPGHOME="$HOME/.config/gnupg/"
export IPYTHONDIR="$HOME/.config/ipython"

export XDG_CONFIG_HOME="$HOME/.config"

# screenshot directory
export GRIM_DEFAULT_DIR="${HOME}/screenshots"

# use colored fd for fzf
export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --type file --color=always --hidden --exclude .git"

# colors found here: https://github.com/ianchesal/nord-fzf
export FZF_DEFAULT_OPTS="--ansi --reverse \
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1 \
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1 \
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac \
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b"


[ $(uname) = 'Darwin' ] && export CLIPBOARD="pbcopy"
[ $(uname) = 'Linux' ] && export CLIPBOARD="wl-copy"
