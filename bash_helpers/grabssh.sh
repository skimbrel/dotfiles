#!/bin/sh
SSHV="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

for x in ${SSHV} ; do
    (eval echo $x=\$$x) | sed  's/=/="/
                                s/$/"/
                                s/^/export /'
done 1>$HOME/.bash_helpers/fixssh