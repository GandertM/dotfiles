# from https://github.com/dreamsofautonomy/
# see youtube: https://www.youtube.com/watch?v=ud7YxC33Z3w
# see https://github.com/zdharma-continuum/zinit

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

#if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
#  eval "$(/opt/homebrew/bin/brew shellenv)"
#fi

# Set your path
PATH="$HOME/.fzf/bin:$HOME/.local/bin:$PATH"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
#zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::colored-man-pages
#zinit snippet OMZP::archlinux
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q
# The cdreplay is important if you use plugins like OMZP::kubectl or asdf-vm/asdf, because these plugins call compdef.
# it speeds up stuff

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e                            # emacs keybindings
bindkey '^p' history-search-backward  # ctrl-p : search history backward (p = previous)
bindkey '^n' history-search-forward   # ctrl-n : search history forward (n = next)
bindkey '^[w' kill-region             # alt-w  : kill from the cursor to the mark

# History
HISTSIZE=25000
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
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # autocompletion with both upper- and lowercase
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # autocompletion with colors (only for ls
zstyle ':completion:*' menu no                          # disables default zsh completion / see plugin Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'  # fzf file browser
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' #

# Change by kanter
# change of default colours (green en red) to (blue and red)
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# Aliases
[[ -f "$ZDOTDIR"/.zsh_aliases ]] && source "$ZDOTDIR"/.zsh_aliases

# Shell integrations
eval "$(fzf --zsh)"                    # option --zsh only works in 0.48.0 or later (add fzf to PATH)
#[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh  # after install from https://github.com/junegunn/fzf.git
#eval "$(zoxide init --cmd cd zsh)"
eval "$(zoxide init zsh)"                 # after install from https://github.com/ajeetdsouza/zoxide

# Prompt
eval "$(starship init zsh)"
