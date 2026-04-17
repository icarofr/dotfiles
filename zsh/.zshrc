# ---- History ----
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# ---- Prompt ----
# fallback prompt until starship initializes
PROMPT='%n@%m:%~ %# '

# ---- Disable autocorrect ----
unsetopt CORRECT_ALL

# ---- Completion ----
autoload -Uz compinit
compinit -u

# ensure 'menuselect' exists
zmodload zsh/complist 2>/dev/null || true

if bindkey -M menuselect >/dev/null 2>&1; then
  bindkey -M menuselect '^P' up-line-or-history
  bindkey -M menuselect '^N' down-line-or-history
  bindkey -M menuselect '^R' history-incremental-search-backward
fi

# ---- Aliases ----
alias fetch='fastfetch'
alias neofetch='fastfetch'
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'

# ---- Safe fallback PATH additions ----
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
export PATH

# ---- Directory jumping ----
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh --cmd cd)"
fi

# Antidote plugin manager
ANTIDOTE_DIR="${ZDOTDIR:-$HOME}/.antidote"

if [ -f "$ANTIDOTE_DIR/antidote.zsh" ]; then
  source "$ANTIDOTE_DIR/antidote.zsh"

  BUNDLES_FILE="${ZDOTDIR:-$HOME}/.zsh_plugins.txt"
  GENERATED="${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"

  if [ -f "$BUNDLES_FILE" ]; then
    # regenerate plugins file if needed
    if [ ! -f "$GENERATED" ] || [ "$BUNDLES_FILE" -nt "$GENERATED" ]; then
      antidote bundle < "$BUNDLES_FILE" > "$GENERATED"
    fi

    source "$GENERATED"
  fi
fi


# ---- Optional: Starship ----
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# ---- Editor ----
export EDITOR=nano
export VISUAL=nano

# ---- Local overrides ----
[ -f "${ZDOTDIR:-$HOME}/.zshrc.local" ] && source "${ZDOTDIR:-$HOME}/.zshrc.local"

# ---- FZF customisation ---
export FZF_DEFAULT_OPTS="--multi --border --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#1d2021,bg+:#3c3836
  --color=hl:#689d6a,hl+:#d79921,info:#458588,marker:#d79921
  --color=prompt:#b8bb26,spinner:#b16286,pointer:#d65d0e,header:#d3869b
  --color=border:#d79921,query:#d9d9d9
  --border="rounded" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆"'

  
