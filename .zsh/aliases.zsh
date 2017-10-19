## ALIASES ##
#alias ls='ls --color=auto'
alias ls='ls -G' # OSX (BSD) uses different bind for showing colour

# 256 colour term support
alias tmux='tmux -2'

# convenience for dev server
alias devs='dev server'

# convenience aliases for git
alias gg='git grep'
alias gd='git diff'
alias gl='git log'
alias gs='git status'
alias gb='git branch'
alias ga='git add'
alias gp='git push'
alias gc='git checkout'
alias gr='git rebase'

# clear terminal && tmux shell at the same time
alias clear!='clear && tmux clear-history'

# aga to ag -all-types (ignores .ignore BUT not hidden files)
alias aga='ag --all-types'
