#!/bin/sh

# 安裝 homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

## ===== ZSH 部分 ===== ##

# 安裝 zsh
brew install zsh zsh-completions;

# 安裝自動提示
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 修改shall預設
sudo sh -c "echo $(which zsh) >> /etc/shells";
chsh -s $(which zsh);

# 重開
echo $SHELL;


# 安裝 oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
rm ~/.zshrc;

# link 2 zshrc
git clone https://github.com/z20240/.zshrc.git .zsh_folder;
ln ~/.zsh_folder/.zshrc ~/.zshrc;
source ~/.zshrc

## ===== VIM 部分 ===== ##

# 下載 Vundle
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
# 下載 vimrc
git clone https://github.com/z20240/.vim.git .vim;
ln ~/.vim/.vimrc ~/.vimrc;
vim +PluginInstall +qall;

# 下載顏色
# git clone https://github.com/tomasr/molokai.git ~/molokai
# silent !mkdir -p ~/.vim/colors;
# mv ~/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim;
# rm -rf ~/molokai;
# source ~/.vimrc

## ===== GITCONFIG 部分 ===== ##

# 下載 gitconfig
git clone https://github.com/z20240/.gitconfig.git ~/.gitconfig_folder;
ln ~/.gitconfig_folder/.gitconfig ~/.gitconfig;

## ==== 使用全域搜尋小工具來代替 grep ==== ##
git clone https://github.com/z20240/simpleGrep.git ~/.grepTool_folder
ln ~/.grepTool_folder/grepTool /usr/local/bin/grepTool;



## ==== Tmux 安裝 ==== ##
brew install tmux;
sudo apt-get install tmux;

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;

https://github.com/z20240/.tmux.git ~/.tmux_folder;
ln ~/.tmux_folder/.tmux.conf ~/.tmux.conf;

# type this in terminal if tmux is already running
$ tmux source ~/.tmux.conf

# ==== Options (選配) ==== #

# -- ranger 是一個非常方便的文件導航 cmd. -- #
# brew install ranger # for osx
# sudo apt install ranger # for linux.

# -- JSON 視覺化互動工具 -- #
# npm install -g fx

# -- 使用 SQL 找尋檔案 -- #
# brew install fselect # for osx

# for linux, 需要先安裝 rustup 再從 rustup 安裝 fselect
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# cargo install fselect
