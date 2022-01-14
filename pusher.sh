#!/bin/bash
find . -name "index.html" -exec bash -c 'mv "{}" "$(dirname "{}")"/README.md' \;
if [[ ! -z $1 ]]; then
        git add . && git commit -m $1 && git push
fi
