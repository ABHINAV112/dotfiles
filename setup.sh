chmod +x $HOME/bin/*

git config --global push.autoSetupRemote true

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install zoxide
brew install fzf
brew install ripgrep
brew install gh
brew install fswatch
brew install jq
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# yabai --install-sa TODO
# yabai --load-sa

yabai --start-service
skhd --start-service


tmux source $HOME/.tmux.conf

