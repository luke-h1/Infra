default: help

.PHONY: help
help:
## help: This helpful list of commands
	@echo "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/-/'


.PHONY: vscode
vscode:
## vscode: Install vscode extensions 
				@./vscode/vscode.sh


.PHONY: mac-install
mac-install:
## mac-install: run main setup script for mac (run before playbook)
				@./mac/index.sh

.PHONY: dotfiles 
dotfiles:
## dotfiles: zsh config & global ssh config
				cp -r ./mac/dotfiles/.zshrc ~/.zshrc
				cp -r ./mac/dotfiles/.ssh/config ~/.ssh/config

.PHONY: playbook
playbook:
## playbook: Main mac ansible playbook
				ansible-playbook -u lukehowsam -K -K --ask-pass -vvv mac/index.yml
