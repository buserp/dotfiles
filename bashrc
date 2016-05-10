# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR='vim'

function __prompt_command() {
    local EXIT="$?"             # Get the exit code for the last-run process
    PS1=": "  # Starting with ":" allows entire-line copy n' paste

    local Red='\[\e[1;31m\]'
    local Gre='\[\e[1;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Cyan='\[\e[1;36m\]'
    local WhiteCol='\[\e[0;37m\]'
    local Pur='\[\e[1;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+="${Red}${EXIT} ${WhiteCol}:${Red}\u@\h"      # Add red if exit code non-0
    else
        PS1+="${Gre}${EXIT} ${WhiteCol}:${Gre}\u@\h"
    fi

    PS1+="${WhiteCol}:${Pur}[\t]"
    PS1+="${WhiteCol}:${Cyan}\!"
    PS1+="${WhiteCol}:${BBlu}\w"
    PS1+="${WhiteCol}; "
}
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs

# Grep through your history
function hgrep() {
  history | grep "$1"
}

readonly PHILIPGLASS="     hi   phi. .      phi llipe glass

 m    m m y name is dan and i had a         q question i wa  s wo  ndering what di--- what do you i mean, what d d do you                       think of                    this b *oh wait hold on     ok   oh dang    o. . .                   oh ok                          ok i got it                            here ,  um ,   wh at do y                                    ou                       thi n             k                    of            thtis - thi-s be  be at

 *808 clap snare boing boing ba boing clap snare snare baiessese*"

if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
