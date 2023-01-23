#!/bin/bash

# install git zsh vim
sudo apt-get install git-all zsh vim-gtk3 tmux
chsh -s $(which zsh)    # set zsh as default shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"   # install oh-my-zsh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k       # install powerlevel10k
git clone https://github.com/sickill/vim-monokai.git ~/.vim/colors                            # install monokai colorscheme for vim
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


Dotfiles=(".vimrc" ".zshrc" ".tmux.conf")

dir="${HOME}/Documents/dotfiles"

for dotfile in "${Dotfiles[@]}"; do
	echo "creating symlinks for $dotfile"
	ln -sf $dir/$dotfile ${HOME}/${dotfile} 
done
