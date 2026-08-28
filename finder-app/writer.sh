#!/bin/bash

writefile=$1
writestr=$2

if [ ! "$writefile" ]
  then
  echo "Missing argument! No file argument. Expected usage:"
  echo "writer.sh file string"
  echo "          ^^^^       "
  exit 1
fi

if [ ! "$writestr" ]
  then
  echo "Missing argument! No string argument. Expected usage:"
  echo "writer.sh file string"
  echo "               ^^^^^^"
  exit 1
fi

if ! dir=$(dirname "$writefile")
  then
  echo "Invalid directory? This message shouldn't even be displayed"
  exit 1
fi

if [ ! -e "$dir" ]
  then
  mkdir -p "$dir"
fi

echo "$writestr" > "$writefile"
exit 0
