autoload -U compinit
compinit -u

export LANG=ja_JP.UTF-8


#source ~/.bash/git-completion.bash
PS1="$(hostname -fs)@$(whoami):$(pwd) \$ "
RPROMPT="%T"                      # 右側に時間を表示する
setopt transient_rprompt          # 右側まで入力がきたら時間を消す
setopt prompt_subst

export LESS='-R'
export LESSOPEN='| /usr/local/Cellar/source-highlight/3.1.5/bin/src-hilite-lesspipe.sh %s'

export GISTY_DIR="$HOME/src/gists"

