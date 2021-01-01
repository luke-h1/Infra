#!/bin/bash
brew uninstall node 
brew uninstall node --ignore-dependencies node
brew cleanup
brew uninstall --force node
brew install node 