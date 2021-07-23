###################### ENVIRONMENT VARIABLES #######################
eval "`fnm env`"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
###################### ENVIRONMENT VARIABLES #######################

###################### ALIASES #######################
alias nvim=$HOME/local/nvim/bin/nvim
alias vim=nvim
alias lsd="$HOME/.cargo/bin/lsd -a"
alias br="$HOME/.cargo/bin/broot"
alias gitui=$HOME/.cargo/bin/gitui
###################### ALIASES #######################

###################### OPTIONS #######################
# enable colors and change prompt
autoload -U colors && colors

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
###################### OPTIONS #######################

###################### PLUGINS #######################

###################### PLUGINS #######################