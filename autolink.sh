#!/bin/bash

# Make sure that current working directory is the repo
repo="$(dirname "$0")"
cd $repo

repoName=$(pwd)
configPath=$HOME/.config

if [[ $repoName != $configPath ]]; then
  if [[ -e $HOME/.config ]]; then
    echo "Another '.config' directory detected. Aborting."
    exit 1
  fi
  mv $repoName $configPath
fi

targets=(
  'bash/bashrc'
  'bash/bash_profile'
  'git/gitconfig'
  'inputrc'
  'vim'
  'xorg/xinitrc'
  'xorg/Xresources'
)

for target in ${targets[@]}; do
  echo ".config/$target -> $HOME/.${target##*/}"
  ln -s .config/$target $HOME/.${target##*/}
done

echo 'done.'