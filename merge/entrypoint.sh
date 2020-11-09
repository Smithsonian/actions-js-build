#!/bin/sh
## This GitHub Action for git merges the origin branch onto a target branch.
##
## Required environment variables:
## - $TARGET_BRANCH: The branch to merge into

set -e

# Set up .netrc file with GitHub credentials
git_setup ( ) {
  # Git requires our "name" and email address -- use GitHub handle
  git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
  git config user.name "$GITHUB_ACTOR"
}

echo "Merging onto $TARGET_BRANCH."
git_setup
git checkout "$TARGET_BRANCH"
git merge --no-ff "$GITHUB_REF"