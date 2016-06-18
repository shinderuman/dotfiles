autoload -U compinit
compinit -u

export LANG=ja_JP.UTF-8

# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '[%s][%F{green}%b%f]:'
zstyle ':vcs_info:*' actionformats '[%s][%F{green}%b%f(%F{red}%a%f)]:'
# プロンプト表示直前にvcs_info呼び出し
precmd() { vcs_info }
# プロンプト表示
PROMPT='%F{cyan}%m%f:${vcs_info_msg_0_}%c%F{yellow}%# %f'
RPROMPT='%T'

RPROMPT="%T"                      # 右側に時間を表示する
setopt transient_rprompt          # 右側まで入力がきたら時間を消す

alias vi=vim
alias gobuildraspberry='GOOS=linux GOARCH=arm GOARM=5 go build $1'
alias gobuildubuntu='GOOS=linux GOARCH=386 go build $1'
alias tmtm='tmux -S ~/tmux/default attach'

# .ssh hostname補完
function print_known_hosts () {
    if [ -f $HOME/.ssh/known_hosts ]; then
        cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
    fi
}
_cache_hosts=($( print_known_hosts ))
