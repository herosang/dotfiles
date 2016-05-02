# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bernard/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# alias for 256 colour term support
alias tmux='tmux -2'

autoload -U promptinit
promptinit

prompt redhat
alias ls='ls --color=auto'

PATH=$PATH:~/.gem/ruby/2.2.0/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# RVM bash completion
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
