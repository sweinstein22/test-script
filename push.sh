#!/usr/bin/env bash
set -e

git pull -r

var=$(git rev-parse --abbrev-ref HEAD)
if [[ "$var" == "master" ]]; then
  printf "It looks like you are committing to master. If this is something that needs to be backported, please make the commit there and then use this script to merge it forward.\n Do you want to continue? [y/N]:"

  read input
  if [[ "$input" == "y" || "$input" == "Y" ]]; then
    # make
    git push
  fi
  exit 0
fi

make
git push
printf "Do you want to merge this commit forward to master? [y/N]: "

read input
if [[ "$input" == "y" || "$input" == "Y" ]]; then
  git checkout master
  git merge v7
  git push

  git checkout v7
fi
