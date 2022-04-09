### anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

### alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias sb='source ~/.bashrc'
alias rebash='exec $SHELL -l'
alias listen='lsof -i -P'
alias c='clear'

alias dp='docker ps'
alias di='docker images'
alias dn='docker network ls'
alias dv='docker volume ls'
alias dc='docker-compose'
alias didown='docker system prune --all'
alias dvdown='docker volume prune'

alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gg='git graph'
alias gm='git commit -m'
alias gp='git push'
alias gc='git clone'
alias gb='git branch'
alias gh='git checkout'
