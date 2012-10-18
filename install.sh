#!/bin/bash

base=".dotfiles"
dirs=( ".config" )
files=( ".config/geany" ".ssh" ".vim" ".bashrc" ".gitconfig" ".gitignore_global" ".vimrc" ".xinitrc" )

echo "Creating dirs"

for dir in ${dirs[@]}; do
    if [ ! -d "$dir" ]; then
        echo "# mkdir ~/$base/$dir"
        mkdir ~/$base/$dir
    fi
done

echo "Moving config files to .dotfiles dir."

for file in ${files[@]}; do
    f1=~/$file
    f2=~/$base/$file

    echo "# mv $f1 $f2"
    mv $f1 $f2
    echo "# ln -s $f2 $f1"
    ln -s $f2 $f1
done
