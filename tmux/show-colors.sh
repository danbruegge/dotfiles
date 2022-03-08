#!/bin/sh
BREAK=6
count=0

for i in {0..255} ; do
    let "count++"

    printf "\x1b[38;5;%smcolour%s \t" "${i}" "${i}"

    if [ $count == $BREAK ]; then
        printf "\n"
        count=0
    fi
done

printf "\n"
