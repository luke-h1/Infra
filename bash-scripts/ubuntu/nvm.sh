#!/bin/bash 
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install node
nvm install 8.10.0
nvm use 10.16.3
nvm alias default 10.16.3
