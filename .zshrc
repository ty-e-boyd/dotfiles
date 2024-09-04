# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Source OMP
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  # eval "$(oh-my-posh init zsh)"
  # eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jandedobbeleer.omp.json)"
  eval "$(oh-my-posh init zsh --config ~/.config/omp/tylers.toml)"
fi

# Export Paths
# Flutter
export PATH="$PATH:/Users/tboyd/Development/toolkit/flutter/bin"
# Zig
export PATH="$PATH:/Users/tboyd/Development/toolkit/zig-0.12.0-dev/ig"
# Xpdf
export PATH="$PATH:/Users/tboyd/Development/toolkit/xpdf-tools-4.05/binARM"
# flutterfire
export PATH="$PATH":"$HOME/.pub-cache/bin"
# go bin
export PATH="$PATH":"$HOME/go/bin"
# Deno
export PATH="$PATH":"$HOME/.deno/bin"

# NVIM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/Users/tboyd/.ghcup/env" ] && source "/Users/tboyd/.ghcup/env" # ghcup-env

# fzf
eval "$(fzf --zsh)"

# eza
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user"

# thef**k
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"

# bat isntead
alias cat="bat"

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# my own personal aliases :D
alias configgy="nvim ~/.zshrc"

# bun completions
[ -s "/Users/tboyd/.bun/_bun" ] && source "/Users/tboyd/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
