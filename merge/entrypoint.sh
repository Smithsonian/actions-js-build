#!/bin/sh
## This GitHub Action for git merges the merge branch onto a working branch.
##
## Required environment variables:
## - $MERGE_BRANCH: The branch to merge
## - $WORKING_BRANCH: The branch to merge into

set -e

# Set up .netrc file with GitHub credentials
git_setup ( ) {
  # Git requires our "name" and email address -- use GitHub handle
  git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
  git config user.name "$GITHUB_ACTOR"
}

git_setup

# Fetch and track the merge branch
echo "Checking out merge branch: $MERGE_BRANCH."
git fetch origin $MERGE_BRANCH
git checkout -B $MERGE_BRANCH origin/$MERGE_BRANCH

echo "Checking out working branch: $WORKING_BRANCH."
git fetch origin $WORKING_BRANCH
git checkout -B $WORKING_BRANCH origin/$WORKING_BRANCH

# Merge the merge branch into the working branch
echo "Merging $MERGE_BRANCH into $WORKING_BRANCH."
git merge --no-ff --no-edit $MERGE_BRANCH
