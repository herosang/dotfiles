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
