#!/bin/sh

# ====== 安裝 homebrew ====== #

# --------------------------------------
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
# --------------------------------------



## ===== ZSH 部分 ===== ##

# --------------------------------------
# 安裝 zsh
brew install zsh zsh-completions;

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


# 安裝自動提示
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 安裝可以自動跳轉的工具, 未來使用 `j` 就可以跳至曾經去過的 file path
brew install autojump
# -- linux 安裝方法 -- #
### git clone git://github.com/joelthelion/autojump.git
### cd autojump
### ./install.py

# syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

source ~/.zshrc
# --------------------------------------



# ==== 使用 bat 代替 cat ==== #

# --------------------------------------
brew install bat
## linux 安裝方法
### sudo dpkg -i bat_0.6.0_amd64.deb
# --------------------------------------



# ==== 使用 fzf 代替 find ===== #

# --------------------------------------
brew install fzf
## linux 安裝方法
### sudo apt-get install fzf
# --------------------------------------



## ===== VIM 部分 ===== ##

# --------------------------------------
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
# --------------------------------------



## ===== GITCONFIG 部分 ===== ##

# --------------------------------------
# 下載 gitconfig
git clone https://github.com/z20240/.gitconfig.git ~/.gitconfig_folder;
ln ~/.gitconfig_folder/.gitconfig ~/.gitconfig;
# --------------------------------------



## ==== 使用全域搜尋小工具來代替 grep ==== ##

# --------------------------------------
git clone https://github.com/z20240/simpleGrep.git ~/.grepTool_folder
ln ~/.grepTool_folder/grepTool /usr/local/bin/grepTool;
# --------------------------------------



## ==== Tmux 安裝 ==== ##

# --------------------------------------
brew install tmux;
sudo apt-get install tmux;

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm;

https://github.com/z20240/.tmux.git ~/.tmux_folder;
ln ~/.tmux_folder/.tmux.conf ~/.tmux.conf;

# type this in terminal if tmux is already running
$ tmux source ~/.tmux.conf
# --------------------------------------



# ==== Tilling window management ==== #

# yabai --------------------------------
# https://github.com/koekeishiya/yabai
# Please follow this instruction. 
# https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(from-HEAD)
# MacOS window manager
brew install koekeishiya/formulae/yabai --HEAD
# If in M1 OSX
ln -s /opt/homebrew/bin/yabai /usr/local/bin/yabai

# jq -----------------------------------
# https://github.com/stedolan/jq
# Lightweight and flexible command-line JSON processor
brew install jq

# skhd ---------------------------------
# https://github.com/koekeishiya/skhd
# Simple hotkey daemon for macOS
brew install koekeishiya/formulae/skhd

# --------------------------------------
# Remove previous links
rm -f "${HOME}"/.{yabai,skhd}rc
# clone settings
git clone https://github.com/z20240/yabai.git "${HOME}"/.config/yabai
ln -s "${HOME}/.config/yabai/yabai/yabairc" "${HOME}/.yabairc"
ln -s "${HOME}/.config/yabai/skhd/skhdrc" "${HOME}/.skhdrc"

# --------------------------------------
# Will automatically start Yabai when computer starts
brew services start yabai
# Will automatically start skhd when computer starts
brew services start skhd

# --------------------------------------
# Install hammerspoon (https://github.com/Hammerspoon/hammerspoon)
brew install hammerspoon --cask
# or download *.zip manually from https://github.com/Hammerspoon/hammerspoon/releases/latest
# start the hammerspoon in dashboard.

# ---------------------------------------
# Install stackline (https://github.com/AdamWagner/stackline)
# Get the repo
git clone https://github.com/AdamWagner/stackline.git ~/.hammerspoon/stackline
# Make stackline run when hammerspoon launches
cd ~/.hammerspoon
cp ~/.hammerspoon/stackline/conf.lua ~/.hammerspoon/stakeline_config.lua
# **Hint**: If is M1 - you have to change the code below
# -- in stackline/conf.lua
# c.paths.yabai = '/opt/homebrew/bin/yabai' -- silicon mac, M1
# c.paths.yabai = '/usr/local/bin/yabai'    -- intel version.
echo 'stackline = require "stackline"' >> init.lua
echo 'stackline:init()' >> init.lua

# Übersicht -----------------------------
# Install Übersicht (https://github.com/felixhageloh/uebersicht)
# (Do it manually) => download the app on website and install: http://tracesof.net/uebersicht/

## create a widgets folder ---------------
mkdir ~/Documents/ubersicht
## simple-bar ----------------------------
git clone https://github.com/z20240/simple-bar ~/Documents/ubersicht/simple-bar
cd ~/Documents/ubersicht/simple-bar && cp settings.template.json settings.json
ln -s ~/Documents/simple-bar $HOME/Library/Application\ Support/Übersicht/widgets/simple-bar
## calendar ----------------------------
git clone https://github.com/z20240/ubersicht-calender ~/Documents/ubersicht/ubersicht-calender
ln -s ~/Documents/ubersicht-calender $HOME/Library/Application\ Support/Übersicht/widgets/calendar
 

# ==== 鼠鬚管輸入法 ==== #

# --------------------------------------
# 下載鼠鬚管
git clone https://github.com/z20240/squirrel.git ~/squirrel

# 點擊 .pkg 安裝

# 下載 Rime 設定檔
rm -rf ~/Library/Rime
git clone https://github.com/z20240/Rime.git ~/Library/Rime

# 將 essay.txt 覆蓋到 input 中，使習慣用語貼近台灣用語
sudo cp ~/squirrel/essay.txt /Library/Input\ Methods/Squirrel.app/Contents/SharedSupport/essay.txt
# --------------------------------------



# ==== Options (選配) ==== #
# --------------------------------------
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
# --------------------------------------
