#!/bin/sh -l
git symbolic-ref -q HEAD
if [ $? -eq 1 ]
then
  echo "Git is in detached HEAD mode skip ..."
  exit
fi
/usr/local/bin/sdkgen update --remove
git config --global user.name "SDKgen-Bot";
git config --global user.email "bot@sdkgen.app";
git config --global --add safe.directory /github/workspace
git add -A
git commit -m "Update code generation"
git push https://$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git
