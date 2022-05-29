#!/bin/bash

Dotfiles=(".vimrc" ".zshrc" ".tmux.conf")

dir="${HOME}/Documents/dotfiles"

for dotfile in "${Dotfiles[@]}"; do
	echo "creating symlinks for $dotfile"
	ln -sf $dir/$dotfile ${HOME}/${dotfile} 
done
