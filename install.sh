#!/bin/bash
set -e
ROOT=$(dirname $(readlink -f $0))
echo $ROOT
echo $HOME
sudo apt-get install zsh -y
chsh -s /bin/zsh
function link_file() {
	if [[ -f $2 ]];then
		echo "[WARN]: $1 found, config failed!"
		echo "[WARN]: Please check $1 and $2 and get the right choice!\n"
	else
		ln -s $1 $2
	fi
}
function link_dir() {
	if [[ -d $2 ]];then
		echo "[WARN]: $1 found, config failed!!\n"
		echo "[WARN]: Please check $1 and $2 and get the right choice!\n"
	else
		ln -s $1 $2
	fi
}
link_file $ROOT/.zshrc $HOME/.zshrc
link_dir $ROOT/bin $HOME/bin
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "source ~/bin/superenv.sh" >> ~/.zshrc
