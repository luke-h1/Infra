#!/bin/bash 

# rm any existing versions of node 
brew uninstall --ignore-dependencies node 
brew uninstall --force node 

# install nvm
brew update && brew install nvm 

# mkdir nvm in home 
mkdir /Users/lukehowsam/.nvm 

# add the below to .zshrc 
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

# source ~/.zshrc 

# nvm ls-remote 
# nvm install node 
# nvm install 14 
# nvm use 14 