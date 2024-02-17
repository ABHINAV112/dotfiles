export PATH="$PATH:/Users/abhinav/homebrew/bin"
export PATH="/Users/abhinav/homebrew/opt/mongodb-community@4.4/bin:$PATH"
export PATH="~/bin:$PATH"

# auto complete for kubectl
autoload -U +X compinit && compinit
source <(kubectl completion zsh)
