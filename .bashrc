# DOCKER
export DOCKER_CLI_EXPERIMENTAL=enabled

# Ignore wine errors output
export WINEDEBUG=-all

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

# clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# equery
alias eqf='equery f'
alias equ='equery u'
alias eqh='equery h'
alias eqa='equery a'
alias eqb='equery b'
alias eql='equery l'
alias eqd='equery d'
alias eqg='equery g'
alias eqc='equery c'
alias eqk='equery k'
alias eqm='equery m'
alias eqy='equery y'
alias eqs='equery s'
alias eqw='equery w'

# jump words
bind '"\e[5C": forward-word'    # control+arrow_right
bind '"\e[5D": backward-word'   # control+arrow_left

# set a fancy prompt
parse_git_branch()
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='[\u@\[\033[01;33m\]\H\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]\[\033[92m\]$(parse_git_branch)\[\033[00m\]]\$ '

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

export CSCOPE_EDITOR=vim


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

LS_COLORS='rs=0:di=01;94:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.cfg=00;32:*.conf=00;32:*.diff=00;32:*.doc=00;32:*.ini=00;32:*.log=00;32:*.patch=00;32:*.pdf=00;32:*.ps=00;32:*.tex=00;32:*.txt=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

complete -cf sudo
