#!/usr/bin/env zsh

set -e

defaults write com.apple.dock static-only -bool true; killall Dock # Only show active programs in dock.
defaults write com.apple.menuextra.battery ShowPercent YES; killall SystemUIServer # Show battery percent.
defaults write com.apple.dock autohide -bool true; # turn Dock auto-hidng on
defaults write com.apple.dock autohide-delay -float 0; # remove Dock show delay

defaults write NSGlobalDomain AppleShowAllExtensions -bool true; # show all file extensions

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

killall Dock 2>/dev/null;
killall Finder 2>/dev/null;

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install \
  git \
  openssl \
;

brew cask install \
  1password \
  alfred \
  docker \
  dropbox \
  iterm2 \
  spectacle \
  visual-studio-code \
;


