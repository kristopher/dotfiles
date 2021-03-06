alias reload='source ~/.bash_profile && echo "Reloaded ~/.bash_profile"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd..='cd ..'
alias ll='ls -lh'
alias la='ls -lA'
alias du='du -hc'
alias more='less'

alias lc='wc -l'

export CLICOLOR=1
export LSCOLORS=gxgxcxdxbxegedabagacad

alias e='$EDITOR'
alias nano='nano -w'
alias o='open'

pkillall() {
  if [ -z "$2" ]; then
    pgrep $1 | xargs kill;
  else
    pgrep $2 | xargs kill $1;
  fi
}
