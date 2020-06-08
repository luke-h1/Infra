#!/bin/bash

xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew cask install iterm2 #terminal 
brew install bash #latest version of bash 
brew install git
brew install vcprompt
brew cask install spectacle #window-manager / window-snapper 
brew cask install alfred #replacement for spotlight 
brew cask install firefox
brew cask install google-chrome 
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash #install nvm 
nvm install stable
npm install -g lite-server eslint #install lite-server & eslint 
brew cask install visual-studio-code #vscode install 


