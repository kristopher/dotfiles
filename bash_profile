export STEAM_ID=76561197992811702

export PATH=~/bin::$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
eval "$(rbenv init -)"
export PATH="./bin:$PATH"

for a in `ls $HOME/.bash_profile.d/*.sh`; do
  source $a
done

export VISUAL=`first_of "subl -w" "mate -w" "nano -w" vi`
export EDITOR=$VISUAL
export GIT_EDITOR=`first_of "subl -w" "mate -wl1" "nano -w" vi`

ulimit -n 10240

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
