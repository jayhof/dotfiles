#!/bin/sh

# install homebrew
if ! [ -x "$(command -v brew)" ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "skipping homebrew install, already installed"
fi


# brew formulae
brew install \
	composer \
	git \
	httpie \
	nvm \
	the_silver_searcher \
	vim \
	yarn

# brew casks
brew tap \
	homebrew/cask \
	homebrew/cask-fonts \
	homebrew/core \

brew cask install \
	docker \
	font-fira-code \
	font-inconsolata-nerd-font \
	iterm2 
