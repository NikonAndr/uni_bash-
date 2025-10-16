#!/bin/bash

#Check If K is passed as an arg
if [ -z "$1" ]; then
    echo "ERROR: Pass K as an argument!"
    exit 1
fi

K="$1"

#Check if K is a directory
if [ ! -d "$K" ]; then
    echo "ERROR: K is not a directory"
    exit 1
fi

empty_files_num=$(find "$K" -maxdepth 1 -type f -size 0c | wc -l)
dir_num=$(find "$K" -maxdepth 1 -type d -perm -u+x | wc -l)

echo "Number of empty files $empty_files_num"
echo "Number of directories $dir_num"