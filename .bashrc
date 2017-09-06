#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

# alias for 256 colour term support
alias tmux='tmux -2'

PATH=$PATH:~/.gem/ruby/2.2.0/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# initialize fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
