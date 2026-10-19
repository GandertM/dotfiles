# ~~~~~~~~~~~~~~~~~~~~~~ .zshrc ~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~ Globbing ~~~~~~~~~~~~~~~~~~~~~~~~~~

#setopt extended_glob null_glob
setopt extended_glob

# ~~~~~~~~~~~~~~~~~~~~~~ Path Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Remove duplicates in and non-existing from PATH
typeset -aU path       # deduplicate

path_prepend() {
  local dir="$1"
  [[ -d "$dir" ]] || return 0     # skip if non-existing
  path=("$dir" $path)
}

path_append() {
  local dir="$1"
  [[ -d "$dir" ]] || return 0     # skip if non-existing
  path+=("$dir")
}

path_append  "$HOME/bin"
path_append  "$HOME/projects"

# Export the PATH variable to make it available to child processes
export PATH

# ~~~~~~~~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set my editor
export EDITOR="/usr/bin/fresh"
export VISUAL="/usr/bin/codium"

# Set my man pages
export MAN_POSIXLY_CORRECT=1

# ~~~~~~~~~~~~~~~~~~~~~~ History Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=25000
SAVEHIST=25000

setopt extended_history       
setopt share_history          
setopt hist_fcntl_lock        
setopt hist_ignore_all_dups   
setopt hist_save_no_dups      
setopt hist_expire_dups_first 
setopt hist_find_no_dups      
setopt hist_ignore_space      
setopt hist_reduce_blanks     
setopt hist_verify         

# Do not save lines with runs of escaped spaces (broken completions)
zshaddhistory() {
    [[ "$1" != *'\ \ \ '* ]]
}

# ~~~~~~~~~~~~~~~~~~~~~~ Zinit Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [[ ! -d "$ZINIT_HOME" ]]; then
    #mkdir -p "$(dirname $ZINIT_HOME)"
    mkdir -p "${ZINIT_HOME:h}"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
if [[ -r "${ZINIT_HOME}/zinit.zsh" ]]; then
    source "${ZINIT_HOME}/zinit.zsh"
fi

# Completion definitions must be on fpath before compinit
if (( ${+functions[zinit]} )); then
    zinit light zsh-users/zsh-completions
fi

# Add in snippets (including aliases)
if (( ${+functions[zinit]} )); then
    zinit snippet OMZP::git
    zinit snippet OMZP::sudo
    zinit snippet OMZP::colored-man-pages
    zinit snippet OMZP::command-not-found
fi

# Load completions; keep the dump file in the cache dir instead of $ZDOTDIR
ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR"
autoload -Uz compinit && compinit -d "$ZSH_CACHE_DIR/zcompdump"

if (( ${+functions[zinit]} )); then
    zinit cdreplay -q
fi

# Plugins that wrap widgets: fzf-tab after compinit, syntax-highlighting LAST
if (( ${+functions[zinit]} )); then
    zinit light Aloxaf/fzf-tab
    zinit light zsh-users/zsh-autosuggestions
    zinit light zsh-users/zsh-syntax-highlighting
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Key Bindings ~~~~~~~~~~~~~~~~~~~~~~~~~~

bindkey -e                            # emacs keybindings

# Search history for lines starting with what is already typed
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^p' up-line-or-beginning-search    # ctrl-p : previous matching command
bindkey '^n' down-line-or-beginning-search  # ctrl-n : next matching command

#bindkey '^[w' kill-region             # alt-w  : kill from the cursor to the mark

bindkey '^[[1;5C' forward-word        # moving between words with CTRL+right
bindkey '^[[1;5D' backward-word       # moving between words with CTRL+left

bindkey '^[u' undo                    # undo with alt+u
bindkey '^[r' redo                    # redo with alt+r

# ~~~~~~~~~~~~~~~~~~~~~~ Conmpletion Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'              # autocompletion with both upper- and lowercase
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"             # autocompletion with colors (only for ls)
zstyle ':completion:*' menu no                                      # disables default zsh completion / see plugin Aloxaf/fzf-tab

if command -v eza >/dev/null 2>&1; then
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --icons --git --group-directories-first "$realpath"'
    zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --color=always --icons --git --group-directories-first "$realpath"'
else
    zstyle ':fzf-tab:complete:cd:*' fzf-preview "ls --color $realpath"  # fzf file browser
    zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Colour Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# change of default colours (green en red) to (blue and red)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# ~~~~~~~~~~~~~~~~~~~~~~ Aliases and Functions ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Load once at startup (not on every prompt)
[[ -r "$ZDOTDIR/.zsh_aliases" ]]   && source "$ZDOTDIR/.zsh_aliases"
[[ -r "$ZDOTDIR/.zsh_functions" ]] && source "$ZDOTDIR/.zsh_functions"

# ~~~~~~~~~~~~~~~~~~~~~~ Startup Output ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Only show banners in a top-level shell, not in sub-shells
if [[ $SHLVL -eq 1 ]]; then

    # Fastfetch
    if command -v fastfetch >/dev/null 2>&1; then
        fastfetch
    fi

    # Fzf - reminder
    if command -v fzf >/dev/null 2>&1; then
        echo ''
        echo '---------------------------------------------------'
        echo ' Key-bindings for fzf '
        echo '---------------------------------------------------'
        echo ' ALT-c  - cd into the selected directory '
        echo ' CTRL-t - Paste the selected files and directories '
        echo ' CTRL-r - Paste the selected command from history '
        echo '---------------------------------------------------'
    fi
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Sourcing Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# Starship
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# Fzf key bindings and completion
if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --zsh)"             # option --zsh only works in 0.48.0 or later (add fzf to PATH)
fi

# Zoxide must be initialised last
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init --cmd cd zsh)"       # integrate zoxide into cd
fi

# ~~~~~~~~~~~~~~~~~~~~~~ End Configuration ~~~~~~~~~~~~~~~~~~~~~~~~~~

# ~~~~~~~~~~~~~~~~~~~~~~ Thanks to ~~~~~~~~~~~~~~~~~~~~~~~~~~
# Youtube 'Dreams of Autonomy' for guidance
# github.com/chhoumann/dotfiles for examples
# ~~~~~~~~~~~~~~~~~~~~~~ END ~~~~~~~~~~~~~~~~~~~~~~~~~~
