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



#Smart Brackets

if [[ ! -d ~/.config/zsh/zsh-autopair ]]; then
	git clone https://github.com/hlissner/zsh-autopair ~/.config/zsh/zsh-autopair
fi

source ~/.config/zsh/zsh-autopair/autopair.zsh
autopair-init






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


export PATH="$HOME/scripts/:$PATH"
export XDG_CONFIG_HOME="/home/nature/.config"




autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%(?..%K{red}(%?%)%k)%B%K{blue}${vcs_info_msg_0_}%k%b'
# PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'


# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"
