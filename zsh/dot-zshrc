autoload -U promptinit
autoload -U compinit 
promptinit
compinit
prompt fade green

echo "Hello Nature!"


#PS1="%K{yellow}%n%k@%m:%~/ > %D"
#RPS1="%(?..%K{red}(%?%)%k)"


alias ls='ls --color=auto'
alias ls='lsd'

alias sd='shutdown now'

alias gs='git status'
alias gl='git log'
alias gc='git checkout'




# Because if fpath no update,complete system will not be found
fpath=($HOME/Documents/complete $fpath)



setopt hist_verify



# for zsh vim mode 
bindkey -v
export KEYTIMEOUT=5

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		# normal mode: block cursor
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} == '' ]] || [[ $1 = 'beam' ]]; then
		# Insert mode: line cursor
		echo -ne '\e[5 q'
	fi
}

zle -N zle-keymap-select

# init enter shell setting line cursor
zle-line-init() {
	zle --K viins
	echo -ne '\e[5 q'
}
zle -N zle-line-init

echo -ne '\e[5 q'




export PATH="$HOME/scripts/:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"



#Smart Brackets

if [[ ! -d $XDG_CONFIG_HOME/zsh/zsh-autopair ]]; then
	git clone https://github.com/hlissner/zsh-autopair $XDG_CONFIG_HOME/zsh/zsh-autopair
fi

source $XDG_CONFIG_HOME/zsh/zsh-autopair/autopair.zsh
autopair-init



# default text editor
export EDITOR="/usr/bin/nvim"



function ra_dot ()
{
	if [[ $LBUFFER = *.. ]];then
		LBUFFER+=/..
	else	
		LBUFFER+=.
	fi
}
zle -N ra_dot
bindkey . ra_dot



zstyle ':completion:*' format %d
zstyle ':completion:*' menu select=1
zstyle ':completion:*:cd:*' ignore-parents parent pwd
# Ignore case-sensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'







autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

RPROMPT='%(?..%K{red}(%?%)%k)%B${vcs_info_msg_0_}%b'
# PROMPT='${vcs_info_msg_0_}%


# untracked file is exist origin format string
# using hook to solve it
zstyle ':vcs_info:git+set-message:*' hooks git-untracked

+vi-git-untracked() {
	if [[ -n $(git ls-files --others) ]]; then
		hook_com[unstaged]+='%F{yellow}??%f'
	fi
}

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{green}M%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}M%f'
# staged | unstaged | untracked | branch
zstyle ':vcs_info:git:*' formats '%c%u%K{blue}%b%k'





# cache on
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/.zcompcache"


############## heritage from virtualbox fedora-sway
# zstyle ':completion:*' completer _complete _ignored _correct _approximate
# zstyle :compinstall filename '$HOME/.zshrc'
#
#
# zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
#
#
# autoload -Uz zmv
# . /usr/libexec/z.sh
# . "$HOME/.acme.sh/acme.sh.env"
##############


# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"


# reverse search
bindkey '^R' history-incremental-search-backward
