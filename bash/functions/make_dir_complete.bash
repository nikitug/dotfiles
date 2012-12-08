#!/bin/bash

make_dir_complete() {
    local aliasname=$1
    local dirname=$2
    local prgname="__s_${aliasname}__"
    FUNC="function $prgname() {
        local cur len wrkdir;
        local IFS=\$'\\n'
        wrkdir=\"$dirname\"
        cur=\${COMP_WORDS[COMP_CWORD]};
        len=\$((\${#wrkdir} + 2));
        COMPREPLY=( \$(compgen -S/ -d \$wrkdir/\$cur| cut -b \$len-) );
    }"
    eval $FUNC
    complete -o nospace -F $prgname $aliasname
}
