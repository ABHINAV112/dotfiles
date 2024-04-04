chmod +x $HOME/bin/*

git config --global push.autoSetupRemote true

brew install zoxide
brew install fzf
brew install ripgrep
brew install gh
brew install fswatch
brew install jq
brew install yabai
brew install skhd

# yabai --install-sa TODO
# yabai --load-sa

yabai --start-service
skhd --start-service


tmux source $HOME/.tmux.conf

