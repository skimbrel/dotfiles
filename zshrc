#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR=vim

PATH=/usr/local/bin:/usr/local/sbin:~/bin:${PATH}
export PATH

alias l="ls"
alias ll="ls -l --group-directories-first"
alias attach="~/.bash_helpers/grabssh.sh && screen -Urd"
alias fixssh="source ~/.bash_helpers/fixssh"
alias g='git'
alias status='git status'
alias log='git log'
alias co='git checkout'
alias shove='git push origin HEAD'
alias usermem="ps auxwwwf | awk '{ foo[\$1] += \$6 } END { for (user in foo) { print foo[user] \" \" user }}' | sort -rn"
alias tm='open -a TextMate'
alias h='ssh'
alias gfo='git fetch origin'
alias gfr='git checkout master && git fetch origin && git pull --rebase origin master'
alias gpo='git push origin'
alias gps='git push skimbrel'
alias gyo='git pull origin'
alias sshv='cd ~/twilio/chef/vagrants/cluster && vagrant ssh'
alias sharedenv='. ~/venv3/bin/activate'
alias sharedenv2='. ~/venv/bin/activate'
alias localenv='. venv/bin/activate'
alias igrep='grep -i'
alias big='osascript ~/.scripts/largetext.scpt'
alias replyto='python3 -c "import random; print(chr(random.randint(9984,10175)),end=\"\")" | tee >(pbcopy); echo'
alias tbhno='kill %1'
alias reload="source ~/.zshrc"
alias fmtjs='python -mjson.tool'
alias fmtxml='xmllint --format -'
alias gitjk='history 10 | tail -r | gitjk_cmd'
alias shit='sudo $(history -p \!\!)'

waitfor() {
    "$@" ; big done
}

setopt CORRECT
setopt CORRECTALL

set -o vi

# Run a command and snarfle its output into the OS X paste buffer
function grab {
    $@ | tee >(pbcopy)
}

# Same, but grab stderr too.
function graberr {
    "$@" 2>&1 | tee >(pbcopy)
}

#eval $(thefuck --alias)

source ~/z-zsh/z.sh
alias j=z

if [ -f ~/.zshrc_local ]; then
    . ~/.zshrc_local
fi

autoload -Uz promptinit
promptinit
prompt agnoster
