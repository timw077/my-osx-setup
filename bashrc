export VISUAL=vim
export EDITOR=$VISUAL
export HISTFILESIZE=
export HISTSIZE=
export OPSCODE_USER=d3k225
export CHEF_USER=timw
export GIT_SSH_COMMAND="ssh -q"
export HOMEBREW_NO_ANALYTICS=1

PATH=${PATH}:~/bin
eval "$(chef shell-init bash)"
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
. ~/.localbashrc
