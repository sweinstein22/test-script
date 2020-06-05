#!/usr/bin/env bash
set -ex

git pull -r
# make
git push

printf "Do you want to merge this commit forward to master? [y/N]: "

read input
if [[ "$input" == "y" || "$input" == "Y" ]]; then
  git checkout master
  git merge v7
  git push

  git checkout v7
fi
