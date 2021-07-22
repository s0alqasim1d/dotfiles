###################### ENVIRONMENT VARIABLES #######################
eval "`fnm env`"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
###################### ENVIRONMENT VARIABLES #######################

###################### ALIASES #######################
alias nvim=$HOME/local/nvim/bin/nvim
alias vim=nvim
###################### ALIASES #######################

###################### PLUGINS #######################

###################### PLUGINS #######################