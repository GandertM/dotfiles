# based on: https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc

# To avoid duplicates in $PATH
typeset -aU path

# Function to pre-append the directory to the path array.
pre_append_to_path() {
   local dir="$1"
   [[ -d "$dir" ]] && path=("$dir" $path)
}

# Function to append the directory to the path array.
append_to_path() {
   local dir="$1"
   [[ -d "$dir" ]] && path+=("$dir")
}

# Set your path
pre_append_to_path "$HOME/.fzf/bin" # (add fzf to PATH), see below
append_to_path "$HOME/bin"
append_to_path "$HOME/Projects"

# Export the PATH variable to make it available to child processes
export PATH

# Set my editor
export EDITOR=/usr/bin/micro

# Set my man pages
export MAN_POSIXLY_CORRECT=1

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets (including aliases)
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e                            # emacs keybindings
bindkey '^p' history-search-backward  # ctrl-p : search history backward (p = previous)
bindkey '^n' history-search-forward   # ctrl-n : search history forward (n = next)
bindkey '^[w' kill-region             # alt-w  : kill from the cursor to the mark

# History
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

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'              # autocompletion with both upper- and lowercase
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"             # autocompletion with colors (only for ls)
zstyle ':completion:*' menu no                                      # disables default zsh completion / see plugin Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'  # fzf file browser
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# change of default colours (green en red) to (blue and red)
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# Fastfetch
if [ -f /usr/bin/fastfetch ]; then
	fastfetch
fi

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

# Aliases
#[[ -f "$ZDOTDIR"/.zsh_aliases ]] && source "$ZDOTDIR"/.zsh_aliases -- see precmd()

# Functions
#[[ -f "$ZDOTDIR"/.zsh_functions ]] && source "$ZDOTDIR"/.zsh_functions -- see precmd()

# Shell integrations
eval "$(fzf --zsh)"                 # option --zsh only works in 0.48.0 or later (add fzf to PATH)
#eval "$(zoxide init zsh)"           # after install from https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"  # https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc

# Source aliases and functions for every new prompt or after every command
precmd() {
   [[ -f "$ZDOTDIR"/.zsh_aliases ]] && source "$ZDOTDIR"/.zsh_aliases
   [[ -f "$ZDOTDIR"/.zsh_functions ]] && source "$ZDOTDIR"/.zsh_functions
}

# Prompt
eval "$(starship init zsh)"
