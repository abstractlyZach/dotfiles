# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

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

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

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
# use colored fd for fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always --hidden --exclude .git"
export FZF_DEFAULT_OPTS="--ansi --reverse"

# local directory for ruby stuff
export GEM_HOME=~/.local/ruby
export PATH="$PATH:$HOME/.local/ruby/bin"


SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX=""
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_SHOW=always
SPACESHIP_DIR_COLOR="magenta"
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_VENV_PREFIX="(🐍 "
SPACESHIP_VENV_SUFFIX=")"
SPACESHIP_VENV_COLOR="red"
SPACESHIP_GIT_SYMBOL="🦥 "
SPACESHIP_GIT_BRANCH_COLOR="green"

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host
  dir           # Current directory section
  git
  node
  docker
  venv
  line_sep      # line break
  jobs
  exit_code
  char
)


# Setup fzf
if [[ ! "$PATH" == */home/zach/workspace/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/zach/workspace/fzf/bin"
fi

# initialize pyenv with shims and autocompletion
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$(pyenv root)"

export PYTHONSTARTUP=~/.config/common/pythonrc
