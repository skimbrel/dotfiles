# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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
alias gpo='git push origin'
alias gps='git push skimbrel'
alias gyo='git pull origin'
alias sshv='cd ~/twilio/chef/vagrants/cluster && vagrant ssh'
alias sharedenv='. ~/venv/bin/activate'
alias localenv='. venv/bin/activate'
alias igrep='grep -i'
alias big='osascript ~/.scripts/largetext.scpt'

waitfor() {
    $@ ; big done
}


. ~/.git-completion.sh
complete -o default -o nospace -F _git g
. ~/.bash_prompt

shopt -s autocd # a command name that is the name of a directory is executed as if it were the argument to the cd command.
shopt -s cdspell # If set, minor errors in the spelling of a directory component in a cd command will be corrected.
shopt -s dirspell # attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
shopt -s globstar # the pattern ** used in a pathname expansion context will match a files and zero or more directories and subdirectories.  If the pattern is followed by a /, only directories and subdirectories match.
HISTTIMEFORMAT='%F %T ' # Put timestamps in .bash_history
export HISTTIMEFORMAT
shopt -s histappend # the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than  over‐writing the file.
export HISTFILESIZE=10000 # More history.
shopt -s lithist # multi-line commands are saved to the history with embedded newlines rather than using semicolon separators where possible.

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

set -o vi

if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

. ~/.bashrc_local
doge
