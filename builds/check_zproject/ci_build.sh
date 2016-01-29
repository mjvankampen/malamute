#!/usr/bin/env bash
set -e

docker run -v "$REPO_DIR":/gsl zeromqorg/zproject project.xml

if [[ $(git --no-pager diff -w) ]]; then
    git --no-pager diff -w
    echo "There are diffs between current code and code generated by zproject!"
    exit 1
fi
if [[ $(git status -s) ]]; then
    git status -l
    echo "zproject generated new files!"
    exit 1
fi
