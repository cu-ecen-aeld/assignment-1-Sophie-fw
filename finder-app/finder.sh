#!/bin/bash

filesdir=$1
searchstr=$2

if [ ! "$filesdir" ]
  then
  echo "Missing argument! No directory argument. Expected usage:"
  echo "finder.sh directory string"
  echo "          ^^^^^^^^^"
  exit 1
fi

if [ ! -e "$filesdir"  ]
  then
  echo "ERROR: $filesdir is not a directory!"
  exit 1
fi

if [ ! "$searchstr" ]
  then
  echo "Missing argument! No search string argument. Expected usage:"
  echo "finder.sh directory string"
  echo "                    ^^^^^^"
  exit 1
fi

if ! x=$( find "$filesdir" -type f | wc -l )
  then
    echo "Something unexpected happened whilst finding files, exiting"
    exit 1
  fi

if ! y=$( grep -r -s "$searchstr" "$filesdir" | wc -l )
  then
    echo "Something unexpected happened whilst searching files, exiting"
    exit 1
  fi

echo  "The number of files are $x and the number of matching lines are $y"
exit 0
