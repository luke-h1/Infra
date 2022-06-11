# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=${PATH}:/Users/lukehowsam/Library/Python/3.7/bin
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=${PATH}:/Users/lukehowsam/.dotnet/tools
export ZSH="/Users/lukehowsam/.oh-my-zsh"
ZSH_THEME="cloud" 
CASE_SENSITIVE="true"
plugins=(
  git
  zsh-autosuggestions
)
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
source $ZSH/oh-my-zsh.sh
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/usr/local/opt/qt/bin:$PATH"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
ZSH_DISABLE_COMPFIX=true
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ENABLE_CORRECTION="true"

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

alias gwp='git add -A; git commit -am "--wip-- [skip ci]"'
