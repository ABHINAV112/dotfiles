# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:$HOME/homebrew/bin"
export PATH="$HOME/homebrew/opt/mongodb-community@4.4/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"

# auto complete for kubectl
autoload -U +X compinit && compinit
source <(kubectl completion zsh)


# setting up zoxide to replace cd
eval "$(zoxide init bash)"
alias cd="z"

# replace grep with rg
alias grep="rg"

set -o vi
