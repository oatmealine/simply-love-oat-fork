#!/bin/bash

if test $# -lt 2; then
  echo "usage: `basename $0` <to_replace> <replace_value>"
fi

for file in `find . -name "*$1*" -type f`; do
  mv "'$file'" "${file/'$1'/'$2'}"
done