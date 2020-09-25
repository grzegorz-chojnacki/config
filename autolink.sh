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
  echo "Renamed $repo to .config"
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
  newLink=$HOME/.${target##*/}

  ln -si .config/$target $newLink
  echo "$newLink -> .config/$target"
done

echo 'done.'