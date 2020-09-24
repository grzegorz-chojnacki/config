#!/bin/bash

targets=(
  "bashrc"
  "bash_profile"
  "gitconfig"
  "inputrc"
  "vim" # whole directory
  "xinitrc"
  "Xresources"
)

# Make sure that current working directory is the repo
repo="$(dirname "$0")"
cd $repo

for target in ${targets[@]}; do
  path=$(find -name $target -printf '%P\n')
  echo $target "->" .config/$path
  ln -sf .config/$path ~/.$target
done

[[ ${PWD##*/} != '.config' ]] && echo "Rename directory to '.config'"

