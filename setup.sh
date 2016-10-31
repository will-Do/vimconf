#!/bin/sh

VIMDIR='.vim'
OLDPWD=`pwd`

set_up()
{
    echo "Clone original repo"
    cd ~
	git clone https://github.com/will-Do/vimconf.git ${VIMDIR}

    pushd ${VIMDIR}
	echo "Install Vundle to manage other plugins"
    if [ ! -d bundle ]; then
        mkdir bundle
    fi
    pushd bundle
	git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim

    echo "Install YouCompleteMe"
    git clone https://github.com/Valloric/YouCompleteMe.git YouCompleteMe
    pushd YouCompleteMe
    git submodule update --init --recursive
    ./install.py --clang-completer
    pushd +2

    echo "Install pathogen"
    if [ ! -d autoload ]; then
        mkdir autoload
    fi
    curl -LSso autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
    echo "Copy vimrc to ~/.vimrc"
    cp .vimrc ~/.vimrc
    echo "Run :VundleInstall vim to install plugins which configed in vimrc"
    dirs -c
    cd ${OLDPWD}
}

echo "Make sure you have vim, cmake, ctags .. installed"
while true; do
    read -p "Setup [Y/N]?" yn
    case $yn in
        [Yy]* ) set_up; break;;
        [Nn]* ) exit;;
        * ) echo "Input [Yy] or [Nn]";;
    esac
done
