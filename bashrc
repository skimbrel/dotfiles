# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

EDITOR=emacs
export EDITOR

PATH=/usr/local/bin/6a/perl:$PATH
export PATH

TYPECORE_ZYGOTE_SOCK=/tmp/zygote
export TYPECORE_ZYGOTE_SOCK

alias bounce='cfkctl restart'
alias down='cfkctl stop'
alias status='cfkctl status'
alias up='cfkctl start'
alias userinfo='core/tools/run-in-zygote archetype/tools/admin-user --info'
alias makepro='core/tools/run-in-zygote archetype/tools/admin-user --addrole="pro"'
alias debug='phenotype/tools/debug'
alias zygote='core/tools/run-in-zygote'


alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'

#export PS1='\[\e[1;34m\]\u\[\e[1;30m\]@\[\e[1;36m\]\h \[\e[34m\]\W \[\e[3$((($?))&&echo 1m\]:\(||echo 2m\]:\)) \[\e[30m\]\$ \[\e[0m\]'
. ~/.git-completion.sh
. ~/.bash_prompt
