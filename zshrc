# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
TERM=xterm-256color

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="buser"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

# User configuration

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
