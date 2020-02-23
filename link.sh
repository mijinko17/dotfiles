#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/dotfiles"

cd ${DOT_DIRECTORY}
for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" == ".DS_Store" ] && continue
    [ "$f" == ".gitignore" ] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

ln -snfv ${DOT_DIRECTORY}/bin ${HOME}/bin
ln -snfv ${DOT_DIRECTORY}/compile_commands.json ${HOME}/compile_commands.json

echo "dotfiles linked!"
