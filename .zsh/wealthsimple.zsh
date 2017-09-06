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

# wolfman
alias wolfman="$HOME/code/ws/wolfman/bin/wolfman"

# explicitly use node_6 LTS
export PATH="/usr/local/opt/node@6/bin:$PATH"
