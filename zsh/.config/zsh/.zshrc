# based on: https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc

# ~~~~~~~~~~~~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# setopt extended_glob null_glob

path=(
   $HOME/.fzf/bin          # add fzf, see below
   $path                   # Keep existing PATH entries
   $HOME/bin
   $HOME/projects
)

# Remove duplicates in and non-existing from PATH
typeset -aU path
path=($^path(N-/))

# Export the PATH variable to make it available to child processes
export PATH

# ~~~~~~~~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set my editor
export EDITOR=/usr/bin/micro

# Set my man pages
export MAN_POSIXLY_CORRECT=1

# ~~~~~~~~~~~~~~~~~~~~~~ Zinit Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
if [[ -r "${ZINIT_HOME}/zinit.zsh" ]]; then
   source "${ZINIT_HOME}/zinit.zsh"
fi

# Add in zsh plugins
if (( ${+functions[zinit]} )); then
   zinit light zsh-users/zsh-syntax-highlighting
   zinit light zsh-users/zsh-completions
   zinit light zsh-users/zsh-autosuggestions
   zinit light Aloxaf/fzf-tab
fi

# Add in snippets (including aliases)
if (( ${+functions[zinit]} )); then
   zinit snippet OMZP::git
   zinit snippet OMZP::sudo
   zinit snippet OMZP::colored-man-pages
   zinit snippet OMZP::command-not-found
fi

# Load completions
autoload -Uz compinit && compinit

if (( ${+functions[zinit]} )); then
   zinit cdreplay -q
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Key Bindings ~~~~~~~~~~~~~~~~~~~~~~~~~~

bindkey -e                            # emacs keybindings

bindkey '^p' history-search-backward  # ctrl-p : search history backward (p = previous)
bindkey '^n' history-search-forward   # ctrl-n : search history forward (n = next)

#bindkey '^[w' kill-region             # alt-w  : kill from the cursor to the mark

bindkey '^[[1;5C' forward-word        # moving between words with CTRL+left
bindkey '^[[1;5D' backward-word       # moving between words with CTRL+right

bindkey '^[u' undo                    # undo with alt+u
bindkey '^[r' redo                    # redo with alt+r

# ~~~~~~~~~~~~~~~~~~~~~~ History Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
HISTSIZE=100000
HISTFILE=$ZDOTDIR/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ~~~~~~~~~~~~~~~~~~~~~~ Conmpletion Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'              # autocompletion with both upper- and lowercase
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"             # autocompletion with colors (only for ls)
zstyle ':completion:*' menu no                                      # disables default zsh completion / see plugin Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'  # fzf file browser
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# ~~~~~~~~~~~~~~~~~~~~~~ Colour Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# change of default colours (green en red) to (blue and red)
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# ~~~~~~~~~~~~~~~~~~~~~~ Sourcing Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Fastfetch
if [ -f /usr/bin/fastfetch ]; then
	fastfetch
fi

# Starship
eval "$(starship init zsh)"

# Fzf - reminder
if [ -f /usr/bin/fzf ]; then
   echo ''
   echo '---------------------------------------------------'
   echo ' Key-bindings for fzf '
   echo '---------------------------------------------------'
   echo ' ALT-c  - cd into the selected directory '
   echo ' CTRL-t - Paste the selected files and directories '
   echo ' CTRL-r - Paste the selected command from history '
   echo '---------------------------------------------------'
fi

# Shell integrations
eval "$(fzf --zsh)"             # option --zsh only works in 0.48.0 or later (add fzf to PATH)
eval "$(zoxide init zsh)"       # see github.com/chhoumann/dotfiles

# Source aliases and functions for every new prompt or after every command
precmd() {
   [[ -f "$ZDOTDIR"/.zsh_aliases ]] && source "$ZDOTDIR"/.zsh_aliases
   [[ -f "$ZDOTDIR"/.zsh_functions ]] && source "$ZDOTDIR"/.zsh_functions
}

# ~~~~~~~~~~~~~~~~~~~~~~ End Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~
