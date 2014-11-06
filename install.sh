#!/bin/sh

if [ ! -d "$HOME/.dotfiles" ]; then
  git clone https://github.com/rav1ko/dotfiles.git "$HOME/.dotfiles"
  cd "$HOME/.dotfiles"
  rake install
else
  echo "dotfiles is already installed"
fi
