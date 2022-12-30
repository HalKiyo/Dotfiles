######user profile######
#mounted windows folder color scheme
eval $(dircolors -b ~/.dircolors)

#error color scheme
color()(set -o pipefail;"$@" 2> >(sed $'s,.*,\e[31m&\e[m,'>&2))

#power shell
eval "$(oh-my-posh-wsl --init --shell bash --config /mnt/c/Users/hasegawa/AppData/Local/Programs/oh-my-posh/themes/iterm2.omp.json)"

#proxy
export ftp_proxy=proxy.noc.titech.ac.jp:3128
export http_proxy=proxy.noc.titech.ac.jp:3128
export https_proxy=proxy.noc.titech.ac.jp:3128

#nvm path and setting
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#fzf path
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#locale setting
export LANG=en_US.utf8

#alias
alias ..='cd ..'
alias ls='ls --color'
alias ll='ls -alh --color'
alias rm='rm -rfi'
alias vi='vim'
alias python='color python3'

alias ta='tmux a -t 0'

alias bs='cat ~/.bashrc'

alias nero='ssh -X hasegawa@192.168.100.200'
alias xeno='ssh -X kajiyama@192.168.100.154'

alias py38='sh ~/start.sh -py38'
alias conda='sh ~/start.sh -conda'
alias jupyter='sh ~/start.sh -jupyter'
alias gpu='sh ~/start.sh -gpu'
alias down='sh ~/start.sh -down'

alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gau='git add -u' #変更されたfileをadd
alias gcm='git commit -m'
alias gpsoh='git push -u origin HEAD' #現在のbranchの最新のcommitをpush

alias dps='docker ps'
alias dimg='docker images'
alias drm='docker rm -f'
alias drmi='docker rmi -f'
