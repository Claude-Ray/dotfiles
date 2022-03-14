#!/bin/bash

# Template for cloning workspace quickly

# GIT_SERVER="git@github.com:"
GIT_SERVER="https://github.com/"

declare -A map=(
  ["claude-ray"]="suckless_list"
  ["tdlib"]="telegram_list"
)

suckless_list=(
  "dwm"
  "st"
)

telegram_list=(
  "td"
)

for namespace in ${!map[@]}; do
  list="${map[$namespace]}[@]"
  list=("${!list}")
  for repo in "${list[@]}"; do
    if ! [ -d "$repo" ]; then
      git clone $GIT_SERVER$namespace/$repo.git
    fi
  done
done
