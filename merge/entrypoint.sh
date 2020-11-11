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

echo "Merging $MERGE_BRANCH."
git_setup

# Fetch and track the merge branch
git fetch origin $MERGE_BRANCH
git checkout --progress --force -B $MERGE_BRANCH refs/remotes/origin/$MERGE_BRANCH

# Checkout the working branch
git checkout -

# Merge the merge branch into the working branch
git merge --no-ff --no-edit origin/$MERGE_BRANCH
