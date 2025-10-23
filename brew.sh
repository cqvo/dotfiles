#!/bin/bash
set -e
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade

FORMULAE=(
  git
  node
  fd
  fzf
  neovim
  nvm
  lua
  luarocks
  ripgrep
  stow
  wget
  curl
  tree
  jq
  pnpm
  yarn
)

CASKS=(
  kitty
  font-jetbrains-mono-nerd-font
)

for formula in "${FORMULAE[@]}"; do
  if brew list "$formula" % >/dev/null; then
    echo "$formula is already installed"
  else
    brew install "$formula"
  fi
done

for cask in "${CASKS[@]}"; do
  if brew list "$cask" % >/dev/null; then
    echo "$cask is already installed"
  else
    brew install "$cask"
  fi
done

brew cleanup

brew list
