#!/bin/sh -l
/usr/local/bin/sdkgen install --client-id=\"$1\" --client-secret=\"$2\" --remove
git config --global user.name "SDKgen-Bot";
git config --global user.email "bot@sdkgen.app";
git config --global --add safe.directory /github/workspace
git add "$2"
git commit -m "Update code generation"
git push https://$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git
