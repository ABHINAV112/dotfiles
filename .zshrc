# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH:~/homebrew/bin"
export PATH="~/homebrew/opt/mongodb-community@4.4/bin:$PATH"
export PATH="~/bin:$PATH"
export PATH="$PATH:~/.cargo/bin"

# auto complete for kubectl
autoload -U +X compinit && compinit
source <(kubectl completion zsh)


# setting up zoxide to replace cd
eval "$(zoxide init bash)"
alias cd="z"

# replace grep with rg
alias grep="rg"

set -o vi
