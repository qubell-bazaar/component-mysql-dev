#!/bin/sh

REVISION=$1

REPO_NAME=$(echo ${TRAVIS_REPO_SLUG} | cut -d/ -f2)
OWNER_NAME=$(echo ${TRAVIS_REPO_SLUG} | cut -d/ -f1)

travis-artifacts upload --path ${REPO_NAME}-cookbooks-${REVISION}.tar.gz --target-path ${OWNER_NAME}/