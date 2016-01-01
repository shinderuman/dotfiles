autoload -U compinit
compinit -u

export LANG=ja_JP.UTF-8


#source ~/.bash/git-completion.bash
#PS1="$(hostname -fs)@$(whoami):$(pwd) \$ "
RPROMPT="%T"                      # 右側に時間を表示する
setopt transient_rprompt          # 右側まで入力がきたら時間を消す

export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

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
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

alias vi=vim
alias gobuildraspberry='GOOS=linux GOARCH=arm GOARM=5 go build $1'
alias gobuildubuntu='GOOS=linux GOARCH=386 go build $1'
alias mosh_ec2_ubuntu='MOSH_KEY=fC8apxK6g+5/8KTUSNkgZA mosh -p 65535 ec2ubuntu'

# .ssh hostname補完
function print_known_hosts () {
    if [ -f $HOME/.ssh/known_hosts ]; then
        cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
    fi
}
_cache_hosts=($( print_known_hosts ))
