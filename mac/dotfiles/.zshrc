export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=${PATH}:/Users/lukehowsam/Library/Python/3.7/bin
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=${PATH}:/Users/lukehowsam/.dotnet/tools

# Path to your oh-my-zsh installation.
export ZSH="/Users/lukehowsam/.oh-my-zsh"
ZSH_THEME="cloud" 
CASE_SENSITIVE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/usr/local/opt/qt/bin:$PATH"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
ZSH_DISABLE_COMPFIX=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias gwp='git add -A; git commit -am "--wip-- [skip ci]"'


# Path to your oh-my-zsh installation.
export ZSH="/Users/lukehowsam/.oh-my-zsh"
ZSH_THEME="cloud" 
CASE_SENSITIVE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/usr/local/opt/qt/bin:$PATH"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
#eval "$(ssh-agent -s)
ZSH_DISABLE_COMPFIX=true
export JAVA_HOME=$(/usr/libexec/java_home)

export ANDROID_HOME=/Users/lukehowsam/Library/Android/sdk
export ANDROID_SDK_ROOT=/Users/lukehowsam/Library/Android/sdk
export ANDROID_AVD_HOME=/Users/lukehowsam/.android/avd
export PATH=$ANDROID_HOME/platform-tools:$PATH

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
