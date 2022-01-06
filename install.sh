set -euf -o pipefail

function install_prereqs() {
	sudo apt install curl vim git zsh tmux
}

function setup_vim() {
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall
}

function setup_links() {
	ln -s $(realpath ./vimrc) $(realpath ~/.vimrc)
	ln -s $(realpath ./tmux.conf) $(realpath ~/.tmux.conf)
	ln -s $(realpath ./zshrc) $(realpath ~/.zshrc)
}


function main() {
	setup_links
	install_prereqs
	setup_vim
}

main
