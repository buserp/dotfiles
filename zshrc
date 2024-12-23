# We ball
export EDITOR=vim

# Enable colors
autoload -Uz colors && colors

# Case insensitive tab completion.
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Based on robbyrussell's default zsh theme:
# https://github.com/robbyrussell/oh-my-zsh/wiki/themes#robbyrussell
local ret_status=""
PROMPT="%(?:%{$fg[green]%}%?:%{$fg[red]%}%?)${ret_status} %{$fg[yellow]%}%n@%m %{$fg[magenta]%}%D{%b %e} %* %{$fg[blue]%}%h %{$fg[cyan]%}%~ %{$reset_color%}"

# What is using the ports
alias ports="sudo ss -tulpn | grep LISTEN"

readonly PHILIPGLASS="     hi   phi. .      phi llipe glass

 m    m m y name is dan and i had a         q question i wa  s wo  ndering what di--- what do you i mean, what d d do you                       think of                    this b *oh wait hold on     ok   oh dang    o. . .                   oh ok                          ok i got it                            here ,  um ,   wh at do y                                    ou                       thi n             k                    of            thtis - thi-s be  be at

 *808 clap snare boing boing ba boing clap snare snare baiessese*"

# Fixes for keyboard shortcut movement
bindkey '5C' forward-word
bindkey '5D' backward-word
bindkey '^[[1;5C' forward-word  # Ctrl-right
bindkey '^[[1;5D' backward-word # Ctrl-left
bindkey '3D' backward-word
bindkey '3C' forward-word
bindkey '^[[1;3C' forward-word  # Alt-right
bindkey '^[[1;3D' backward-word # Alt-left
bindkey '^H' backward-kill-word # Ctrl-backspace
bindkey '^[[3;5~' kill-word     # Ctrl-delete
bindkey '^[[3;3~' kill-word     # Alt-delete
bindkey '5~' kill-word
bindkey '3~' kill-word
bindkey '^R' history-incremental-search-backward # Tmux sometimes breaks Ctrl-R

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
