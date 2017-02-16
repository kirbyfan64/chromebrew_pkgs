#!/bin/sh
set -e
find . -mindepth 1 -type d -printf '/%P\n' > dlist
find . -mindepth 1 -type f -printf '/%P\n' > filelist
tar cvzf ../$1.tgz usr dlist filelist

