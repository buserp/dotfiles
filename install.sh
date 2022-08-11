#!/bin/bash
set -euf -o pipefail

function install_prereqs() {
	if command -v "apt-get"; then
		sudo apt-get install curl vim git zsh xclip tmux
	fi
	if [[ -z ~/.tmux/plugins/tpm ]]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	fi
}

function setup_vim() {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall
}

function setup_files() {
	for f in "vimrc" "tmux.conf" "zshrc"; do
		if [[ -a "$HOME/.$f" ]]; then
			echo ""$HOME/.$f" exists, skipping ln."
		else
			ln -s "$(pwd)/$f" "$HOME/.$f"
		fi
	done
	if [[ -a "$HOME/.vimrc.plugins" ]]; then
		echo "$HOME/.vimrc.plugins exists, skipping cp."
	else
		cp "$(pwd)/vimrc.plugins" "$HOME/.vimrc.plugins"
	fi
}

function post_install() {
	tmux source ~/.tmux.conf
	"${HOME}/.tmux/plugins/tpm/bin/install_plugins"
}


function main() {
	install_prereqs
	setup_files
	setup_vim
	post_install
}

main
