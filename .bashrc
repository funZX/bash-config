# Ignore duplicate and don't insert command begin with spaces/tabs
export HISTCONTROL=ignoreboth

# Don't check mail
unset MAILCHECK

# Flush history file
export HISTFILESIZE=0
export HISTSIZE=100

# Ignore sensible commands
export HISTIGNORE=mysqladmin:pgadmin

# Exit after 3 hours
export TMOUT=10800

# Editor
export EDITOR=vim
alias vi="vim"

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto --human-readable --file-type '
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias less='less -r'
alias grep='grep --color=auto'

# fast back
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."

# Special directory listing
alias lsp='ls --color | less -R'
alias llp='ll --color | less -R'
alias lap='la --color | less -R'

# Command prompt before doing stupids things
#alias cp='cp -i'
#alias mv='mv -i'
#alias rm='rm -I'

# others alias
alias md='mkdir'
alias dh='df -h'
alias ssu='sudo su -'
alias sa='source ~/.ssh/agent-vars' 
alias sa-net='source ~/.ssh/agent-vars-netsec' 

# X
alias X='startx &> /dev/null &'

# set a fancy prompt
parse_git_branch()
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='[\u@\[\033[01;33m\]\H\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]\[\033[32m\]$(parse_git_branch)\[\033[00m\]]\$ '

# Includes user's private bin if it exists
if [ -d ~/.bin ] ; then
	export PATH=~/.bin:"${PATH}"
fi	
WORK_DIR=~/.work

if [ -d ${WORK_DIR} ]; then
	for WORK_FILE in `find ${WORK_DIR} -name "$1*"` ; do
		if [[ "${WORK_DIR}" != "${WORK_FILE}" ]] ; then
			source "${WORK_FILE}"
		fi
	done
fi

case $TERM in
	xterm*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}:${PWD/#$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME}:${PWD/#$HOME/~}\033\\"'
		;;
	*)
		PROMPT_COMMAND=""
		;;
esac

case "$-" in
	*i*)
		# Turn off TTY "start" and "stop" commands in all interactive shells.
    	# They default to C-q and C-s, Bash uses C-s to do a forward history search.
    	stty start ''
    	stty stop  ''
    	stty -ixon # disable XON/XOFF flow control
    	stty ixoff # enable sending (to app) of start/stop characters
    	stty ixany # let any character restart output, not only start character
		;;
	*)	
		;;
esac

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi


export CSCOPE_EDITOR=vim
