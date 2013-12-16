#!/bin/bash

REVISION=$1

REPO_NAME=$(echo ${TRAVIS_REPO_SLUG} | cut -d/ -f2);

tar -czf ${REPO_NAME}-cookbooks-${REVISION}.tar.gz cookbooks