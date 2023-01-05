# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=${PATH}:/Users/lukehowsam/Library/Python/3.7/bin
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=${PATH}:/Users/lukehowsam/.dotnet/tools
export PATH=${PATH}:/Users/lukehowsam/.composer/vendor/bin
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# Path to your oh-my-zsh installation.
export ZSH="/Users/lukehowsam/.oh-my-zsh"
ZSH_THEME="cloud" 
CASE_SENSITIVE="true"
plugins=(git)
plugins=(zsh-autosuggestions)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/usr/local/opt/qt/bin:$PATH"
eval "$(fnm env --use-on-cd)"
#eval "$(ssh-agent -s)
ZSH_DISABLE_COMPFIX=true
alias idea="open -a 'IntelliJ IDEA CE.app'"
alias charm="open -a 'PyCharm CE.app'"
alias rider="open -a 'Rider.app'"
alias studio="open -a 'Android Studio.app'"
alias code="open -a 'Visual Studio Code.app'"
alias push="git push"
alias g="git"
alias gs="git status"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
#
#

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"export NVM_DIR=~/.nvm
alias pulls=pulls
source $(brew --prefix nvm)/nvm.sh
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pnpm
export PNPM_HOME="/Users/lukehowsam/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
