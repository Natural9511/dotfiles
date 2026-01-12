autoload -U promptinit
autoload -U compinit 
promptinit
compinit
prompt fade green

echo "Hello Nature!"


#PS1="%K{yellow}%n%k@%m:%~/ > %D"
#RPS1="%(?..%K{red}(%?%)%k)"


alias ls='ls --color=auto'
alias sd='shutdown now'
alias gs='git status'
alias gl='git log'
alias gc='git checkout'



setopt hist_verify

bindkey -v


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



alias ls='lsd'



autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%(?..%K{red}(%?%)%k)%B%K{blue}${vcs_info_msg_0_}%k%b'
# PROMPT='${vcs_info_msg_0_}%# '
zstyle ':vcs_info:git:*' formats '%b'
