alias bashc='vim ~/.bashrc && source ~/.bashrc'
alias bashs='source ~/.bashrc'
alias ll='ls -laH'
alias vim='nvim'
alias v='nvim'

alias sys='cd ~/Dropbox/personal/system && ll'

alias cur='cd ~/Dropbox/projects/trained/ChessTrained && source aliases.sh'
alias pcur='cd ~/Dropbox/projects/trained'
alias work='tmux source-file .tmuxrc'

alias calc='vim ~/.config/khal/config'

alias gpfwl='git push --force-with-lease'
alias gcap='git commit --amend --no-edit && git push --force-with-lease'
alias gs='git status'
alias gdc='git diff --cached'
alias ga='git add'
alias gc='git commit'
alias gl='git log'

alias tmuxk='pkill -f tmux'

alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

# Automation

alias 7copy="history 2 | head -n1 | cut -d' ' -f 5- | pbcopy"

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

source ~/.env_vars
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

PATH=~/Dropbox/deps:$PATH
PATH=~/.local/bin:$PATH
PATH=~/bin:$PATH

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
source ~/src/github.com/jdxcode/gh/bash/gh.bash
source ~/src/github.com/jdxcode/gh/completions/gh.bash
