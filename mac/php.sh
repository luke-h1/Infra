#!/bin/bash

brew install php
brew install composer
echo $PATH
echo "export PATH=$PATH:$HOME/.composer/vendor/bin" >> /Users/${whoami}/.zshrc
composer global require laravel/valet
valet install
composer global require laravel/installer

