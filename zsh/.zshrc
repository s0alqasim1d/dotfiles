# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
##if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
##  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
##fi



###################### Added by Zinit's installer ##########################
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

###################### End of Zinit's installer chunk ##########################



###################### OMZ SETUP ##########################
setopt promptsubst

zinit snippet OMZL::git.zsh

zinit ice atload"unalias grv"
zinit snippet OMZP::git

zinit for OMZL::prompt_info_functions.zsh OMZT::robbyrussell

zinit snippet OMZP::colored-man-pages

zinit ice as"completion"
zinit snippet OMZP::docker/_docker

zinit ice atinit"zicompinit; zicdreplay"
zinit light zdharma/fast-syntax-highlighting
###################### OMZ SETUP ##########################



###################### Power Level 10K Setup ##########################
#notneeded zinit ice depth=1; zinit light romkatv/powerlevel10k
#// To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
##notneeded [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
###################### Power Level 10K Setup ##########################



###################### ZSH Vi Mode ##########################
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
###################### ZSH Vi Mode ##########################



###################### LS_COLORS ##########################
zinit light trapd00r/LS_COLORS
###################### LS_COLORS ##########################



###################### zsh-autocomplete ##########################
zinit lucid light-mode \
  atload"zstyle ':autocomplete:*' groups 'always'" \
  atload"zstyle ':autocomplete:(slash|space):*' magic 'off'" \
  for marlonrichert/zsh-autocomplete
###################### zsh-autocomplete ##########################



###################### Autosuggestions & fast-syntax-highlighting ##########################
zinit ice wait lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions
###################### Autosuggestions & fast-syntax-highlighting ##########################



###################### ENVIRONMENT VARIABLES #######################
export $XDG_CONFIG_HOME=$HOME/.config

export PATH=$HOME/local/rust_apps/fnm:$PATH
eval "`fnm env`"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
###################### ENVIRONMENT VARIABLES #######################