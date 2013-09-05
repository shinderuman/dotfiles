autoload -U compinit
compinit -u

export LANG=ja_JP.UTF-8


#source ~/.bash/git-completion.bash
#PS1="$(hostname -fs)@$(whoami):$(pwd) \$ "
RPROMPT="%T"                      # 右側に時間を表示する
setopt transient_rprompt          # 右側まで入力がきたら時間を消す

export LESS='-R'
export LESSOPEN='| /usr/local/Cellar/source-highlight/3.1.5/bin/src-hilite-lesspipe.sh %s'

export GISTY_DIR="$HOME/src/gists"

case "$TERM" in
    xterm*|kterm*|rxvt*)
    PROMPT=$(print "%B%{\e[34m%}%m:%(5~,%-2~/.../%2~,%~)%{\e[33m%}%# %b")
    PROMPT=$(print "%{\e]2;%n@%m: %~\7%}$PROMPT") # title bar
    ;;
    *)
    PROMPT='%m:%c%# '
    ;;
esac

autoload bashcompinit
bashcompinit
source ~/.git-completion.sh

#go lang
export GOROOT=/usr/local/go
export GOPATH=/usr/local/_go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
