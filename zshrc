# Yes. I don't even know why. But yes.
TERM=xterm-256color

autoload -Uz colors && colors
# Based on robbyrussell's default zsh theme:
# https://github.com/robbyrussell/oh-my-zsh/wiki/themes#robbyrussell
local ret_status=""
PROMPT="%(?:%{$fg[green]%}%?:%{$fg[red]%}%?)${ret_status} %{$fg[yellow]%}%n@%m %{$fg[magenta]%}%D{%b %e} %* %{$fg[cyan]%}%h %{$fg[blue]%}%~ %{$reset_color%}"

# Easy-ass git commits
alias c="git commit -am"

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
