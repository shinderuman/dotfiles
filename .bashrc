source ~/.bash/git-completion.bash
PS1="\h@\u:\$(pwd)\$(__git_ps1) \$ "

export LESS='-R'
export LESSOPEN='| /usr/local/Cellar/source-highlight/3.1.5/bin/src-hilite-lesspipe.sh %s'

export GISTY_DIR="$HOME/src/gists"

# use zsh
if [ -f /bin/zsh ]; then
    exec /bin/zsh
fi
