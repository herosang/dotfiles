# autoloads (should be loaded prior to files below)
source "$HOME/.zsh/autoloads.zsh"

## GENERAL

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

 #The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

# set timeout for switching modes to be very low
export KEYTIMEOUT=1

# source files
typeset -ga sources

# exports
sources+="$HOME/.zsh/exports.zsh"

# bindings
sources+="$HOME/.zsh/bindings.zsh"

# aliases
sources+="$HOME/.zsh/aliases.zsh"

# prompt specific configs
sources+="$HOME/.zsh/prompt.zsh"

# FZF specific configs
sources+="$HOME/.zsh/fzf.zsh"

# Wealthsimple specific configs
# sources+="$HOME/.zsh/wealthsimple.zsh"

# Shopify specific config
# sources+="$HOME/.zsh/shopify.zsh"

# include all sources
foreach file (`echo $sources`)
  if [[ -a $file ]]; then
    source $file
  fi
end
