# install brew apps 
brew update
brew upgrade
brew bundle
sudo easy_install pip 
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
pip3 installl pipenv
pip install --upgrade pip
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash 
nvm install stable
brew update
brew upgrade node 
mkdir -p /Users/lukhowsam/srv/dev
sudo chown -R $USER:$(id -gn $USER) /Users/lukehowsam/.config 
npm i -g vercel lite-server expo-cli typescript
