# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh_history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# reverse search
bindkey '^R' history-incremental-search-backward

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/shell_functions" ] && source "$HOME/.config/shell_functions"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# enable fzf for fuzzy-finding
if [[ ! "$PATH" == */home/zach/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/zach/.fzf/bin"
fi

# local directory for ruby stuff
export GEM_HOME=~/.local/ruby
export PATH="$PATH:$HOME/.local/ruby/bin"

# Setup fzf
if [[ ! "$PATH" == */home/zach/workspace/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/zach/workspace/fzf/bin"
fi

test -r "${XDG_CONFIG_HOME}/dir_colors" && eval $(dircolors "${XDG_CONFIG_HOME}/dir_colors")

if [[ -x pyenv ]]; then
    # initialize pyenv with shims and autocompletion
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_ROOT="$(pyenv root)"
fi

export PYTHONSTARTUP=~/.config/pythonrc

# use virtualenv in cli prompt when using pyenv virtualenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=0

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# lazy load nvm
# https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html
# http://broken-by.me/lazy-load-nvm/
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
  nvm $@
}

if [ -f "${XDG_CONFIG_HOME}/powerlevel10k/powerlevel10k.zsh-theme" ]; then
    source "${XDG_CONFIG_HOME}/powerlevel10k/powerlevel10k.zsh-theme"

    # To customize prompt, run `p10k configure` or edit "${ZDOTDIR}/.p10k.zsh".
    [[ -f "${ZDOTDIR}/.p10k.zsh" ]] && source "${ZDOTDIR}/.p10k.zsh"
fi
