chmod +x $HOME/bin/*

git config --global push.autoSetupRemote true

sudo ln -s $HOME/homebrew/ /opt/

brew update
brew tap homebrew/cask-fonts

brew install --cask font-jetbrains-mono-nerd-font
brew install zoxide
brew install fzf
brew install ripgrep
brew install gh
brew install fswatch
brew install jq
brew install koekeishiya/formulae/skhd
brew install pyenv
brew install pyenv-virtualenv

skhd --start-service

tmux source $HOME/.tmux.conf

# if argument equals "cursor"
if [ "$1" = "cursor" ]; then
    brew install --cask cursor
    defaults write $(osascript -e 'id of app "Cursor"') ApplePressAndHoldEnabled -bool false
fi
