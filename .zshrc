# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

 #The following lines were added by compinstall
zstyle :compinstall filename '/home/bernard/.zshrc'

## AUTOLOADS ##
# TODO: figure out what compinit is
autoload -Uz compinit && compinit

# enable colours
autoload -Uz colors && colors

# enable vcs info on prompts
autoload -Uz vcs_info

# NOTE: preset prompt loading currently disabled (using custom prompt)
# loads and executes the zsh custom prompt functions (to access additional custom prompts)
#autoload -U promptinit && promptinit

## GENERAL ##
# use vi key binding
bindkey -v

# <ctr-k>/<ctrl-j> to navigate up/down line history
bindkey '^k' up-line-or-history
bindkey '^j' down-line-or-history
# <ctrl-g> to move to bottom of history
bindkey '^g' end-of-buffer-or-history

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

## PROMPT CONFIG ##
# set execute prompt function to set prompt to redhat
#prompt redhat

# return shortened string $1 by max_length $2 (used for shortening branch names)
shorten() {
	str="$1"
	max=$2
	new_len=$(($max - 2))
	len="${#str}"
	str=$(echo "$1")

	if [[ "$len" -gt "$max" ]]; then
		echo "${str:0:$new_len}.."
	else
		echo "$str"
	fi
}

PS1="%F{5}[%F{7}%F{6}%n%F{7} %1~%F{5}]%F{7}%(#.#.$) "

#zstyle ':vcs_info:*+*:*' debug true # Display vcs_info debug logs

# NOTE: using !!%b!! as a marker for substitution below (to run shorten function)
# regular state formatting
zstyle ':vcs_info:git*' formats 			"%F{5}[%F{3}!!%b!!%F{5}]%F{7}"
# "actoun" state formatting (ie mid-rebase/merge)
zstyle ':vcs_info:git*' actionformats "%F{5}[%F{3}!!%b!!%F{5}]%F{7} %F{2}(%F{4}%a%F{2})%F{7}"
# keep up to date with staging changes (NOTE: can cause slow-down on large projects)
zstyle ':vcs_info:*' check-for-changes true

# prepare variables for vcs_info in precmd
precmd() {
  vcs_info
  # set VCS_PROMPT if within a vcs repo dir
  regex='(!!([^!]+)!!)' # match expanded !!%b!! expression from vsc_info_msg_0_
  if [[ -n ${vcs_info_msg_0_} &&  ${vcs_info_msg_0_} =~ $regex ]]; then
    # display vcs_info and shorten any branches to 15 characters
    VCS_PROMPT="${${vcs_info_msg_0_}/$match[1]/$(shorten $match[2] 30)}"
  else
    VCS_PROMPT=""
  fi
}

# display the current (vim-like) mode on the right prompt
function zle-line-init zle-keymap-select {
	VIM_NORMAL="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
	VIM_INSERT="%{$fg_bold[green]%} [% INSERT]%  %{$reset_color%}"
	RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT} $VCS_PROMPT"
	zle reset-prompt
}

# Remove the (vim-like) mode prompts before executing. This way they don't
# display in the history of the previous prompts (unnecessary to see what mode I
# completed the prompt on)
function zle-line-finish {
	RPS1="$VCS_PROMPT"
	zle reset-prompt
}

# bind functions above to the following events:
zle -N zle-line-init # executed every time line editor starts reading a new line
zle -N zle-keymap-select # executed every time mode switches (ie vicmd/main)
zle -N zle-line-finish # executed at the end of a prompts execution

# set timeout for switching modes to be very low
export KEYTIMEOUT=1

### WEALTHSIMPLE SPECIFIC CONFIGS
# set rbenv path
export PATH="$HOME/.rbenv/bin:$PATH"

# init rbenv (not sure if this should happen on every startup)
eval "$(rbenv init -)"

# load avn
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# add eb to PATH
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# WS scripps
export PATH="$HOME/code/ws/scripts/bin/:$PATH"

### SHOPIFY SPECIFIC CONFIGS

## android SDK path
#PATH=$PATH:/Users/bl/Library/Android/sdk/platform-tools

## add gpg1 to path (since we can't use gpg2)
#PATH="/usr/local/opt/gnupg/libexec/gpgbin:$PATH"

### SHOPIFY CONFIG ##
## personal access token for homebrew (due to high request rate at Shopify)
#export HOMEBREW_GITHUB_API_TOKEN=a2d4b7e0fb7c4f1d3d81ff7b581c48ed3944f0df

## GOPATH used for cardsink
#export GOPATH=$HOME
#export PATH=$GOPATH/bin:$PATH

## PRY env variable used for enabling pry on shopify
#export PRY=1

#[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

#export PATH="$HOME/.yarn/bin:$PATH"
