#!/bin/bash
set -e
ROOT=$(dirname $(readlink -f $0))
echo $ROOT
echo $HOME
sudo apt-get install zsh -y
chsh -s /bin/zsh
function link_file() {
	if [[ -f $2 ]];then
		echo "[WARN]: $1 found, config may failed!"
	else
		ln -s $1 $2
	fi
}
function link_dir() {
	if [[ -d $2 ]];then
		echo "[WARN]: $1 found, config may failed!"
	else
		ln -s $1 $2
	fi
}
link_file $ROOT/.zshrc $HOME/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
