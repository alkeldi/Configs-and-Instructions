#!/bin/bash

# Install XCode command line tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Reinstall & Fix  Python2.7 
curl https://raw.githubusercontent.com/alkeldi/python2.7fix/master/python2.7fix.sh | bash

# Install Python3 & it's autocompletion
brew install python
python3 -m pip install jedi

# Install C/C++ development tools
brew install cmake pkg-config
brew install llvm # apples's version doesn't contain clangd

# Install basic unix tools
brew install wget htop tmux

# Install Node & Javascript Tools
brew install node npm yarn

# Install vim & neovim 
brew install vim & neovim

# Make neovim use ~/.vimrc
mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim-old
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" > ~/.config/nvim/init.vim

# Install neovim clients
npm install -g neovim
python2 -m pip install pynvim
python3 -m pip install pynvim

# Install vim's vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install FiraCode font
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font

# Install IDEs
brew cask install visual-studio-code clion android-studio

# Install browsers
brew install google-chrome firefox

# Install basic desktop apps
brew cask install microsoft-word spotify stremio discord vlc


