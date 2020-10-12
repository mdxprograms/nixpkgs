#!/bin/sh

DOOM="$HOME/.emacs.d"

if [ ! -d "$DOOM" ]; then
  git clone --depth 1 https://github.com/hlissner/doom-emacs $DOOM
  $DOOM/bin/doom -y install

  if [ ! -d "$HOME/.config/nixpkgs/.doom.d" ]; then
    cp -avr $HOME/.doom.d/ $HOME/.config/nixpkgs/.doom.d/
  fi
fi

$DOOM/bin/doom sync
