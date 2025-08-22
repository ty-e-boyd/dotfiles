plugins=(git)

# Export Paths
# Flutter
export PATH="$PATH:/Users/tboyd/Development/toolkit/flutter/bin"
# Xpdf
export PATH="$PATH:/Users/tboyd/Development/toolkit/xpdf-tools-4.05/binARM"
# flutterfire
export PATH="$PATH":"$HOME/.pub-cache/bin"
# go bin
export PATH="$PATH":"$HOME/go/bin"
# Deno
export PATH="$PATH":"$HOME/.deno/bin"
# Brew
export PATH=/opt/homebrew/bin:$PATH
# Gemini
export GOOGLE_CLOUD_PROJECT="using-gemini-cli"

# NVIM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/Users/tboyd/.ghcup/env" ] && source "/Users/tboyd/.ghcup/env" # ghcup-env

# fzf
eval "$(fzf --zsh)"

# postgres boi
export PATH="/Applications/Postgres.app/Contents/Versions/17/bin:$PATH"

# my tmux setup for resto dev
alias restoman="~/resto_dev.sh"
alias donewerk="tmux kill-server"

# the pomodoro cli
alias getitboy="~/getitboy.sh"

# eza
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user"

# thef**k
if [[ "$ZSH_NAME" == "zsh" ]] && command -v thefuck >/dev/null 2>&1; then
    eval $(thefuck --alias) 2>/dev/null || true
    eval $(thefuck --alias fk) 2>/dev/null || true
fi

# zoxide
if [[ "$ZSH_NAME" == "zsh" ]] && command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)" 2>/dev/null
    # Skip cd alias entirely in Claude Code to avoid zoxide issues  
    if [[ -z "$CLAUDECODE" ]]; then
        # Only alias cd=z if the zoxide function is actually available
        if type __zoxide_z >/dev/null 2>&1; then
            alias cd="z"
        fi
    fi
fi

# bat isntead
alias cat="bat"

# btop instead
alias htop="btop"

# zsh-autosuggestions
if [[ "$ZSH_NAME" == "zsh" ]] && [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null || true
fi

# my own personal aliases :D
alias configgy="nvim ~/.zshrc"

# bun completions
[ -s "/Users/tboyd/.bun/_bun" ] && source "/Users/tboyd/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Source OMP
if [[ "$ZSH_NAME" == "zsh" ]] && [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/omp/tylers.toml)" 2>/dev/null || true
fi

# mise
if [[ "$ZSH_NAME" == "zsh" ]] && command -v ~/.local/bin/mise >/dev/null 2>&1; then
    eval "$(~/.local/bin/mise activate)" 2>/dev/null || true
fi

alias claude="/Users/tylerboyd/.claude/local/claude"
