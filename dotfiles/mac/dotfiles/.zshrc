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
plugins=(
  git
  zsh-autosuggestions
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PATH="/usr/local/opt/qt/bin:$PATH"
alias studio="open -a 'Android Studio.app'"
alias code="open -a 'Visual Studio Code.app'"
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
source $(brew --prefix nvm)/nvm.sh
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
	eval "$(starship init zsh)"
# pnpm
export PNPM_HOME="/Users/lukehowsam/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


alias idea="open -na 'IntelliJ IDEA.app'"


####
# ZSH function to auto-switch to correct Node version
#   https://gist.github.com/callumlocke/30990e247e52ab6ac1aa98e5f0e5bbf5
#
# - Searches up your directory tree for the closest .nvmrc, just like `nvm use` does.
#
# - If you are already on the right Node version, IT DOES NOTHING, AND PRINTS NOTHING.
#
# - Works correctly if your .nvmrc file contains something relaxed/generic,
#   like "4" or "v12.0" or "stable".
#
# - If an .nvmrc is found but you have no installed version that satisfies it, it
#   prints a clear warning, so you can decide whether you want to run `nvm install`.
#
# - If no .nvmrc is found, it does `nvm use default`.
#
# Recommended: leave your default as something generic,
# e.g. do `nvm alias default stable`
####

auto-switch-node-version() {
  NVMRC_PATH=$(nvm_find_nvmrc)
  CURRENT_NODE_VERSION=$(nvm version)

  if [[ ! -z "$NVMRC_PATH" ]]; then
    # .nvmrc file found!

    # Read the file
    REQUESTED_NODE_VERSION=$(cat $NVMRC_PATH)

    # Find an installed Node version that satisfies the .nvmrc
    MATCHED_NODE_VERSION=$(nvm_match_version $REQUESTED_NODE_VERSION)

    if [[ ! -z "$MATCHED_NODE_VERSION" && $MATCHED_NODE_VERSION != "N/A" ]]; then
      # A suitable version is already installed.

      # Clear any warning suppression
      unset AUTOSWITCH_NODE_SUPPRESS_WARNING

      # Switch to the matched version ONLY if necessary
      if [[ $CURRENT_NODE_VERSION != $MATCHED_NODE_VERSION ]]; then
        nvm use $REQUESTED_NODE_VERSION
      fi
    else
      # No installed Node version satisfies the .nvmrc.

      # Quit silently if we already just warned about this exact .nvmrc file, so you
      # only get spammed once while navigating around within a single project.
      if [[ $AUTOSWITCH_NODE_SUPPRESS_WARNING == $NVMRC_PATH ]]; then
        return
      fi

      # Convert the .nvmrc path to a relative one (if possible) for readability
      RELATIVE_NVMRC_PATH="$(realpath --relative-to=$(pwd) $NVMRC_PATH 2> /dev/null || echo $NVMRC_PATH)"

      # Print a clear warning message
      echo ""
      echo "WARNING"
      echo "  Found file: $RELATIVE_NVMRC_PATH"
      echo "  specifying: $REQUESTED_NODE_VERSION"
      echo "  ...but no installed Node version satisfies this."
      echo "  "
      echo "  Current node version: $CURRENT_NODE_VERSION"
      echo "  "
      echo "  You might want to run \"nvm install\""

      # Record that we already warned about this unsatisfiable .nvmrc file
      export AUTOSWITCH_NODE_SUPPRESS_WARNING=$NVMRC_PATH
    fi
  else
    # No .nvmrc file found.

    # Clear any warning suppression
    unset AUTOSWITCH_NODE_SUPPRESS_WARNING

    # Revert to default version, unless that's already the current version.
    if [[ $CURRENT_NODE_VERSION != $(nvm version default)  ]]; then
      nvm use default
    fi
  fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Run the above function in ZSH whenever you change directory
autoload -U add-zsh-hook
add-zsh-hook chpwd auto-switch-node-version
auto-switch-node-version

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
