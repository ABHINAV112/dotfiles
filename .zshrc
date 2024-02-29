# bun completions
[ -s "/Users/abhinav/.bun/_bun" ] && source "/Users/abhinav/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:/Users/abhinav/homebrew/bin"
export PATH="/Users/abhinav/homebrew/opt/mongodb-community@4.4/bin:$PATH"
export PATH="~/bin:$PATH"
export PATH="$PATH:/Users/abhinav/.cargo/bin"

# auto complete for kubectl
autoload -U +X compinit && compinit
source <(kubectl completion zsh)
