# Yes. I don't even know why. But yes.
TERM=xterm-256color

autoload -Uz colors && colors
# Based on robbyrussell's default zsh theme:
# https://github.com/robbyrussell/oh-my-zsh/wiki/themes#robbyrussell
local ret_status=""
PROMPT="%(?:%{$fg[green]%}%?:%{$fg[red]%}%?)${ret_status} %{$fg[yellow]%}%n@%m %{$fg[magenta]%}%D{%b %e} %* %{$fg[cyan]%}%h %{$fg[blue]%}%~ %{$reset_color%}"

# Easy-ass git commits
alias c="git commit -am"

# WE CAN TAKE FROM BASH TOO
if [ -f ~/.profile ]; then
  source ~/.profile
fi

# Go forwards when we say forwards
# And backwards when we say backwards
bindkey '5D' emacs-backward-word
bindkey '5C' emacs-forward-word
bindkey '3D' emacs-backward-word
bindkey '3C' emacs-forward-word
bindkey '5~' kill-word
bindkey '3~' kill-word

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
# End of lines configured by zsh-newuser-install

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
