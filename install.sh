#!/bin/sh

ln -F -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -F -f -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -F -f -s ~/dotfiles/.vimrc ~/.vimrc
ln -F -f -s ~/dotfiles/.zshrc ~/.zshrc

# install homebrew
if ! [ -x "$(command -v brew)" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jay/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo "skipping homebrew install, already installed"
fi

# tap additional repositories
brew tap dart-lang/dart
brew tap weaveworks/tap

# brew formulae
brew install \
	composer \
	git \
	httpie \
	nvm \
	the_silver_searcher \
	vim \
	yarn \
	awscli \
	git-delta \
	direnv \
	drud/ddev/ddev \
	cocoapods \
	dart \
	kubectl \
	kubectx \
	kube-ps1 \
	weaveworks/tap/eksctl \
	llvm \
	go \
	rustup \
	pnpm

# brew casks
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/core

brew install --cask \
	docker \
	font-fira-code \
	font-inconsolata-nerd-font \
	iterm2 \
	sequel-ace \
	responsively \
	flutter
