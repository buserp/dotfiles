# Setup script for Debian-based systems.

main() {
	sudo apt install git vim zsh python2
	python2 dotty.py buser_dotfiles.json
	echo "Changing your shell to ZSH... This will prompt for a password."
	chsh -s $(which zsh)
	echo "Do you want to generate a GitHub-compatible SSH key and display it?"
	select response in "Yes" "No"; do
		case $response in
			Yes ) generate_ssh_key; break;;
			No  ) break;;
		esac
	done
}

generate_ssh_key() {
	echo "generating SSH key"
	ssh-keygen -t ed25519 -C "buser.paul@gmail.com"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
	git config --global user.email "buser.paul@gmail.com"
	git config --global user.name "Paul Buser"
	cat ~/.ssh/id_ed25519.pub
}

main
