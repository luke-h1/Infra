default: help

.PHONY: help
help:
## help: Print help message
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/-/'


.PHONY: mac-install
mac-install:
## mac-install: run main setup script for mac (run before brew.sh)
				@./mac/index.sh

.PHONY: brew
brew:
## brew: Install brew apps
				@./mac/brew.sh

.PHONY: vscode
vscode:
## vscode: Install vscode extensions 
				@./vscode/vscode.sh

.PHONY: dotfiles 
dotfiles:
## dotfiles: zsh config & global ssh config
				cp -r ./mac/dotfiles/.zshrc ~/.zshrc
				cp -r ./mac/dotfiles/.ssh/config ~/.ssh/config
