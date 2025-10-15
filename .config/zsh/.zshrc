# vim:foldmethod=marker

eval "$(/opt/homebrew/bin/brew shellenv)"

# misc {{{

export EDITOR="nvim"
export TERMINAL="st"
export KEYTIMEOUT=1

autoload -U colors && colors

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

__git_files () {
    _wanted files expl 'local files' _files
}

# Shell only exits after the 300th consecutive ctrl-d
IGNOREEOF=300

export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

# }}}

# history {{{

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
SAVEHIST=1000000000
HISTFILE="$HOME/.config/zsh/zsh_history"

# add commands to history immediately
setopt INC_APPEND_HISTORY

export HISTTIMEFORMAT="[%F %T] "

# add timestamp
setopt EXTENDED_HISTORY

# skip duplicates when searching (eg. with C-r)
setopt HIST_FIND_NO_DUPS

# don't write duplicates to history file
setopt HIST_IGNORE_ALL_DUPS
HISTFILE="$HOME/.config/zsh/zsh_history" # Store history in .config

# Scroll through history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# }}}

# Use vim keys in tab complete menu: {{{
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# }}}

# Change cursor shape for different vi modes. {{{
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

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}
# }}}

# less/man colors and settings {{{
# Don't store less history
export LESSHISTFILE=/dev/null
export LESS="-R -F -X $LESS"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# }}}

# fzf {{{
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
source $HOME/.config/zsh/key-bindings.zsh 2>/dev/null # Load fzf keybindings
source $HOME/.config/zsh/completion.zsh 2>/dev/null # Enable fzf completion
# }}}

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null # Load zsh-syntax-highlighting; should be last.
