alias bashc='vim ~/.bashrc'
alias bashs='source ~/.bashrc'
alias ll='ls -laH'
alias vim='nvim'
alias v='nvim'

alias cur='cd ~/current && tmux'
alias work='tmux source-file .tmuxrc'

alias gs='git status'
alias gdc='git diff --cached'
alias ga='git add'
alias gc='git commit'
alias gl='git log'

short_pwd() {
    cwd=$(pwd | perl -F/ -ane 'print join( "/", map { $i++ < @F - 1 ?  substr $_,0,1 : $_ } @F)')
    echo -n $cwd
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"

PS1="(${GREEN}\u${RESET}) ${GREEN}\$(short_pwd)${YELLOW}\$(parse_git_branch) ${RESET}\$ "

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

source ~/.env_vars

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
