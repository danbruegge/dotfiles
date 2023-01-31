#!/bin/sh

# Create directories
mkdir -p ~/workspace &&
mkdir -p ~/.nvm &&

brew update &&

brew bundle --file ~/.dotfiles/Brewfile &&

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install &&

# Install gitmux
go install github.com/arl/gitmux@latest &&

# Install nodejs
nvm install node &&

# Change computer name
sudo scutil --set ComputerName "alfred" &&
sudo scutil --set LocalHostName "alfred" &&
sudo scutil --set HostName "alfred" &&

# do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES &&

# show Library folder
chflags nohidden ~/Library &&

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES &&

# show path bar
defaults write com.apple.finder ShowPathbar -bool true &&

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true &&

killall Finder;
