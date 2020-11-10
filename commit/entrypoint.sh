#!/bin/sh
## This GitHub Action for git commits any changed files and pushes
## those changes back to the origin repository.
##
## Optional environment variables:
## - $WD_PATH: Working directory to CD into before checking for changes
## - $PUSH_BRANCH: Remote branch to push changes to

if [ "$DEBUG" == "false" ]
then
  # Carry on, but do quit on errors
  set -e
else
  # Verbose debugging
  set -exuo pipefail
  export LOG_LEVEL=debug
  export ACTIONS_STEP_DEBUG=true
fi

# If WD_PATH is defined, then cd to it
if [ ! -z "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd "$WD_PATH"
fi

# Replace gitignore with ci-gitignore if it exists
echo "Checking for .gitignore-ci"
if test -e .gitignore-ci
then
  cp .gitignore-ci .gitignore
fi

# Set up .netrc file with GitHub credentials
git_setup ( ) {
  # Git requires our "name" and email address -- use GitHub handle
  git config user.email "$GITHUB_ACTOR@users.noreply.github.com"
  git config user.name "$GITHUB_ACTOR"
}

echo "Checking for uncommitted changes in the git working tree."
git_setup
git add .
# Restore .gitignore so we don't commit the changes
git checkout HEAD .gitignore
if expr $(git status --porcelain | wc -l) \> 0
then
  git commit -m "$COMMIT_MESSAGE"
else
  echo "Working tree clean. Nothing to commit."
fi

# Push even if we didn't commit updated theme files to ensure the merge commit
# from the merge step is pushed.
git push
