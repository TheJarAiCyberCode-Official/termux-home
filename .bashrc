PROMPT_DIRTRIM=2
export PS1="\[\e]0;\u@\h:\w\\a\]\[\e[1;36m\]\w\[\e[0m\] \[\e[1;33m\]\$ \[\e[0m\]"

if [ ! -d "$HOME/usr/bin" ]; then
    mkdir -p "$HOME/usr/bin"
fi
export PATH=$HOME/usr/bin:$PATH

if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

export GPG_TTY=$(tty)
