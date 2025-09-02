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
PROMPT='%F{magenta}[%n]%F{cyan}%m%f:${vcs_info_msg_0_}%c%F{yellow}%# %f'
RPROMPT='%T'

RPROMPT="%T"                      # 右側に時間を表示する
setopt transient_rprompt          # 右側まで入力がきたら時間を消す

alias vi=vim

# .ssh hostname補完
function print_known_hosts () {
    if [ -f $HOME/.ssh/known_hosts ]; then
        cat $HOME/.ssh/known_hosts | tr ',' ' ' | cut -d' ' -f1
    fi
}
_cache_hosts=($( print_known_hosts ))
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

#go lang
export GOROOT=/opt/homebrew/opt/go/libexec
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#export GOOGLE_APPLICATION_CREDENTIALS=$HOME/credential.json

#export RAILS_ENV=development
export PATH=$PATH:$HOME/bin

alias _am1='\
/opt/homebrew/bin/s3fs kindle-asins ~/kindle-asins \
  -o passwd_file=/Users/shinderuman/.passwd-s3fs \
  -o url=https://s3.ap-northeast-1.amazonaws.com \
  -o endpoint=ap-northeast-1 \
  -o use_path_request_style'
alias _am2='\
/opt/homebrew/bin/s3fs rss-feed-filtering ~/rss-feed-filtering \
  -o passwd_file=/Users/shinderuman/.passwd-s3fs \
  -o url=https://s3.ap-northeast-1.amazonaws.com \
  -o endpoint=ap-northeast-1 \
  -o use_path_request_style'
alias _am='_am1 && _am2'

lambda-build() {
  local target_file="${1:-main.go}"
  GOOS=linux GOARCH=amd64 go build -o bootstrap "$target_file" &&
  zip lambda.zip bootstrap &&
  rm bootstrap
}

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
source /Users/shinderuman/src/kindle_bot/scripts/deploy-completion.zsh
