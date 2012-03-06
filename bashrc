# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export EDITOR=vim

PATH=~/bin:${PATH}
export PATH

export PYTHONPATH=$PYTHONPATH:~/py-lib:~/bin 

alias l="ls"
alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias attach="~/.bash_helpers/grabssh.sh && screen -Urd"
alias fixssh="source ~/.bash_helpers/fixssh"
alias tcomp='cheetah compile --nobackup --settings="allowNestedDefScopes=False,useAutocalling=True" --iext=".tmpl"'
alias temps='scons --templates-only'
alias unfuck='make clean && git clean -dfx && make && pgctl stop && pgctl start'
alias boing='pgctl restart'
alias on='pgctl start'
alias off='pgctl stop'
alias g='git'
alias status='git status'
alias log='git log'
alias co='git checkout'
alias shove='git push origin HEAD'
alias usermem="ps auxwwwf | awk '{ foo[\$1] += \$6 } END { for (user in foo) { print foo[user] \" \" user }}' | sort -rn"

. ~/.git-completion.sh
. ~/.bash_prompt

#export PYTHONPATH=~/lib/python:$PYTHONPATH

shopt -s autocd # a command name that is the name of a directory is executed as if it were the argument to the cd command.
shopt -s cdspell # If set, minor errors in the spelling of a directory component in a cd command will be corrected.
shopt -s dirspell # attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
shopt -s globstar # the pattern ** used in a pathname expansion context will match a files and zero or more directories and subdirectories.  If the pattern is followed by a /, only directories and subdirectories match.
HISTTIMEFORMAT='%F %T ' # Put timestamps in .bash_history
export HISTTIMEFORMAT
shopt -s histappend # the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than  over‐writing the file.
export HISTFILESIZE=10000 # More history.
shopt -s lithist # multi-line commands are saved to the history with embedded newlines rather than using semicolon separators where possible.
