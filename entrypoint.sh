#!/bin/sh -l
git config --global user.name "SDKgen-Bot";
git config --global user.email "bot@sdkgen.app";
git config --global --add safe.directory /github/workspace

if [ ! -z "$TYPEHUB_VERSION" ]
then
  echo "Creating tag $TYPEHUB_VERSION ..."
  git tag -a "v$TYPEHUB_VERSION" -m "$TYPEHUB_CHANGELOG"
  git push https://$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git "v$TYPEHUB_VERSION"

  gh release create "v$TYPEHUB_VERSION" -n "$TYPEHUB_CHANGELOG"
  exit
fi

git symbolic-ref -q HEAD
if [ $? -eq 1 ]
then
  echo "Git is in detached HEAD mode skip ..."
  exit
fi

echo "Generate code  ..."

/usr/local/bin/sdkgen update --remove

if [ -z "$TYPEHUB_MESSAGE" ]
then
  TYPEHUB_MESSAGE="Update code generation"
fi

git add -A
git commit -m "$TYPEHUB_MESSAGE"
git push https://$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git
