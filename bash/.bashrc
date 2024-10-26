HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="[\[\e[1;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\]]\[\e[1;91m\]\$(parse_git_branch)\[\e[m\] "

export EDITOR=vim

alias vi='vim'
alias ..='cd ..'
alias rm='rm -i'
alias ls='ls --color=auto'
alias ll='ls -l -h --color=auto'
alias z='zathura --fork'
alias grep='grep --color=auto'
alias search='~/.cfg/scripts/search'
alias cdd='. ~/.cfg/scripts/./cdd'
alias sd='st -e ~/.scripts/./sd $(pwd) >/dev/null &'
alias wttr='curl wttr.in/?1n'
alias dud='sudo du -h -d1'
alias qt='qutebrowser'
alias lg='lazygit'
alias timer='~/.scripts/./timer'

bind 'set completion-ignore-case On'

set -o vi

# Macros to enable yanking, killing and putting to and from the system clipboard in vi-mode. Only supports yanking and killing the whole line.
paste_from_clipboard () {
  local shift=$1

  local head=${READLINE_LINE:0:READLINE_POINT+shift}
  local tail=${READLINE_LINE:READLINE_POINT+shift}

  local paste=$(xclip -out -selection clipboard)
  local paste_len=${#paste}

  READLINE_LINE=${head}${paste}${tail}
  # Place caret before last char of paste (as in vi)
  let READLINE_POINT+=$paste_len+$shift-1
}

yank_line_to_clipboard () {
  echo $READLINE_LINE | xclip -in -selection clipboard
}

kill_line_to_clipboard () {
  yank_line_to_clipboard
  READLINE_LINE=""
}

bind -m vi-command -x '"P": paste_from_clipboard 0'
bind -m vi-command -x '"p": paste_from_clipboard 1'
bind -m vi-command -x '"yy": yank_line_to_clipboard'
bind -m vi-command -x '"dd": kill_line_to_clipboard'
