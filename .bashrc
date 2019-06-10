HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="[\[\e[1;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\]]\[\e[1;91m\]\$(parse_git_branch)\[\e[m\] "

alias ..='cd ..'
alias rm='rm -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias search='~/.scripts/./search'
alias cdd='. ~/.scripts/./cdd'
alias wttr='curl wttr.in/?1n'

bind 'set completion-ignore-case On'

export GUROBI_HOME="/opt/gurobi811/linux64" 
export PATH="${PATH}:${GUROBI_HOME}/bin" 
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--bind=ctrl-i:up,ctrl-k:down'

set -o vi
