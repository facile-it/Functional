#!/bin/sh

# Script that creates symlinks within the git hooks folder pointing to the root folder hooks

if [ ! -d ".git/hooks" ]; then
  mkdir .git/hooks
fi

ln -s -f ../../prepare-commit-msg .git/hooks/prepare-commit-msg
