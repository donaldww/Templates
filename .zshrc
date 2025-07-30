# ────────────────────────────────────────────────
# 🧪 Profiling (Optional)
# ────────────────────────────────────────────────
# zmodload zsh/zprof

# ────────────────────────────────────────────────
# ⚙️  Core Zsh Setup
# ────────────────────────────────────────────────
export DISABLE_AUTO_UPDATE="true"
export ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' matcher-list '' \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'

setopt MENU_COMPLETE

# ────────────────────────────────────────────────
# 📁 Path & Environment Configuration
# ────────────────────────────────────────────────
export JAVA_HOME="$(/usr/libexec/java_home)"

export MISE_GO_SET_GOBIN=false
export GOBIN="$HOME/go/bin"

setopt extendedglob
# Safe, ordered, deduplicated PATH
paths=(
  "$GOBIN"
  "$HOME/.local/bin"
  "$HOME/.mix/escripts"
  "$JAVA_HOME/bin"
  "$HOME/.rvm/bin"
  "$HOME/.swiftly/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "$PATH"
)

# shellcheck disable=SC2034
typeset -U paths

# shellcheck disable=SC2296
export PATH="${(j/:/)paths}"

export MANPATH="/usr/local/man:$MANPATH"
export CDPATH=".:$HOME/Developer"

# ────────────────────────────────────────────────
# 🧠 Toolchain Environment Variables
# ────────────────────────────────────────────────
export TOOLCHAINS=swift
export UV_LINK_MODE=copy
export UV_PYTHON_PREFERENCE=only-managed
export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_BUILD_DOCS="yes"

# ────────────────────────────────────────────────
# 📝 Editor Setup
# ────────────────────────────────────────────────
export EDITOR='zed --wait'
export GIT_EDITOR="$EDITOR"

# ────────────────────────────────────────────────
# 🧼 Git Prompt Optimization
# ────────────────────────────────────────────────
export DISABLE_UNTRACKED_FILES_DIRTY="true"

# ────────────────────────────────────────────────
# 📂 Load Aliases, Functions, Secrets
# ────────────────────────────────────────────────
[[ -f ~/.aliases.zsh ]] && source ~/.aliases.zsh
[[ -f ~/.functions.zsh ]] && source ~/.functions.zsh
[[ -f ~/.secrets.zsh ]] && source ~/.secrets.zsh

[[ -f "$MY_CONFIG_DIR/.aliases.zsh" ]] && source "$MY_CONFIG_DIR/.aliases.zsh"
[[ -f "$MY_CONFIG_DIR/.functions.zsh" ]] && source "$MY_CONFIG_DIR/.functions.zsh"

# ────────────────────────────────────────────────
# ⌨️  Keybindings & Cursor Fix
# ────────────────────────────────────────────────
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

_fix_cursor() { echo -ne '\e[3 q'; }
precmd_functions+=(_fix_cursor)

# ────────────────────────────────────────────────
# 🔌 Plugin Manager & Tools
# ────────────────────────────────────────────────
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
    antidote bundle < "${zsh_plugins}.txt" > "${zsh_plugins}.zsh"
  )
fi
source "${zsh_plugins}.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh)"
source "$HOME/.swiftly/env.sh"
eval "$(direnv hook zsh)"

# zprof
