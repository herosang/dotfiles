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

# rust binaries (installed via rustup)
export PATH="$HOME/.cargo/bin:$PATH"
