#!/bin/bash
brew update
brew upgrade
brew install php
brew install composer
composer global require laravel/valet
valet install
composer global require laravel/installer
