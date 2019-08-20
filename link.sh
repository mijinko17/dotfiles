#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/dotfiles"

cd ${DOT_DIRECTORY}
for f in .??*
do
    [ "$f" = ".git" ] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo "dotfiles linked!"
