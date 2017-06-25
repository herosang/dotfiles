## PROMPT CONFIG ##
# set execute prompt function to set prompt to redhat
#prompt redhat

# return shortened string $1 by max_length $2 (used for shortening branch names)
function shorten() {
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
function precmd() {
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

