#!/bin/sh

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


if [ ! -z "$WD_PATH" ]
then
  echo "Changing dir to $WD_PATH"
  cd $WD_PATH
fi

echo "Installing NPM dependencies"
if test -e package-lock.json; then npm ci; else npm i; fi

echo "Running gulp build"
gulp build
