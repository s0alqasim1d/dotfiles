#####################
# FIRST PROMPT LINE #
#####################
rosso='\e[1;34m'
NC='\e[0m'
echo -e "${rosso}Debian${NC}" `cat /etc/debian_version` "| ${rosso}ZSH${NC} ${ZSH_VERSION}"
#####################
# ZINIT             #
#####################
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

#####################
# THEME             #
#####################
zinit ice depth=1; zinit light romkatv/powerlevel10k


###################### ALIASES #######################

alias nvim="$HOME/local/nvim/bin/nvim"
alias vim=nvim
alias ll="$HOME/.cargo/bin/lsd -al"
alias br="$HOME/.cargo/bin/broot"
alias gitui=$HOME/.cargo/bin/gitui
###################### ALIASES #######################

###################### PLUGINS #######################

# SSH-AGENT
zinit light bobsoppe/zsh-ssh-agent
# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
# ENHANCD
zinit ice wait"0b" lucid
zinit light b4b4r07/enhancd
export ENHANCD_FILTER=fzf:fzy:peco
# HISTORY SUBSTRING SEARCHING
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# TAB COMPLETIONS
zinit ice wait"0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# FZF
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf
# FZF BYNARY AND TMUX HELPER SCRIPT
zinit ice lucid wait'0c' as"command" id-as"junegunn/fzf-tmux" pick"bin/fzf-tmux"
zinit light junegunn/fzf
# BIND MULTIPLE WIDGETS USING FZF
zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit light junegunn/fzf
# FZF-TAB
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab

# SYNTAX HIGHLIGHTING
zinit ice wait"0c" lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# DUF
zinit ice lucid wait"0" as"program" from"gh-r" bpick='*linux_amd64.deb' pick"usr/bin/duf" atload"alias df=duf"
zinit light muesli/duf

# BAT
zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
zinit light sharkdp/bat
# BAT-EXTRAS
zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
zinit light eth-p/bat-extras
alias rg=batgrep.sh
alias bd=batdiff.sh
alias man=batman.sh

# NEOVIM
zinit ice from"gh-r" as"program" bpick"*appimage*" ver"nightly" mv"nvim* -> nvim" pick"nvim"
zinit light neovim/neovim

# RIPGREP
zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep

# ZSH MANYDOTS MAGIC
zinit autoload'#manydots-magic' for knu/zsh-manydots-magic

# TREE-SITTER
zinit ice as"program" from"gh-r" mv"tree* -> tree-sitter" pick"tree-sitter"
zinit light tree-sitter/tree-sitter

# XURLS
zinit ice as"program" from"gh-r" mv"xurls* -> xurls" pick"xurls"
zinit light mvdan/xurls

# GLOW
zinit ice lucid wait"0" as"program" from"gh-r" bpick='*linux_amd64.deb' pick"usr/bin/glow"
zinit light charmbracelet/glow

# CODE-MINIMAP
zinit ice lucid wait"0" as"program" from"gh-r" bpick='*amd64.deb' pick"usr/bin/code-minimap"
zinit light wfxr/code-minimap
###################### PLUGINS #######################


###################### OPTIONS #######################

# enable colors and change prompt

autoload -U colors && colors
# In case term doesn't stop these sequences from being written

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# History in cache directory:

HISTSIZE=1000
SAVEHIST=1000

#####################
# SETOPT            #
#####################
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
# setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect                # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
unsetopt BEEP
setopt vi

#####################
# COLORING          #
#####################
autoload colors && colors

#####################
# FANCY-CTRL-Z      #
#####################
function fg-fzf() {
	job="$(jobs | fzf -0 -1 | sed -E 's/\[(.+)\].*/\1/')" && echo '' && fg %$job
}

function fancy-ctrl-z () {
	if [[ $#BUFFER -eq 0 ]]; then
		BUFFER=" fg-fzf"
		zle accept-line -w
	else
		zle push-input -w
		zle clear-screen -w
	fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#####################
# FZF SETTINGS      #
#####################
export FZF_DEFAULT_OPTS="
--ansi
--layout=default
--info=inline
--height=50%
--multi
--preview-window=right:50%
--preview-window=sharp
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='λ -> '
--pointer='|>'
--marker='✓'
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#####################
# P10K SETTINGS     #
#####################
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

###################### OPTIONS #######################

