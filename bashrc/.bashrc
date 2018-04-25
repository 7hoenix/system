alias bashc='vim ~/.bashrc'
alias bashs='source ~/.bashrc'
alias vimc='vim ~/Vault/dotfiles/nvim/init.vim'
alias ll='ls -laH'
alias vim='nvim'
alias v='nvim'

alias cur='cd ~/current && tmux'
alias work='tmux source-file .tmuxrc'

alias interview='cd ~/Vault/8th-light/internal/interview'

alias gs='git status'
alias gdc='git diff --cached'
alias ga='git add'
alias gc='git commit'
alias gl='git log'

# Set javas

export JAVA_7_HOME=$(/usr/libexec/java_home -v 1.7)
export JAVA_8_HOME=$(/usr/libexec/java_home -v 1.8)

alias java7='export JAVA_HOME=$JAVA_7_HOME'
alias java8='export JAVA_HOME=$JAVA_8_HOME'

#default java7 :(
export JAVA_HOME=$JAVA_7_HOME

# PS1 display prompt

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
