#!/bin/bash

#check if K is passed as an Argument 
if [ $# -ne 1 ]; then 
    echo "ERROR: Pass K as an argument!"
    exit 1
fi 

K="$1"

#check if K is a directory 
if [ ! -d "$K" ]; then 
    echo "ERROR: K is not a directory!"
    exit 1
fi 

num_of_empty_files=0
num_of_dirs=0

for f in "$K"/*; do 
    if [ -f "$f" ] && [ ! -s "$f" ]; then
        ((num_of_empty_files++))
    fi 

    if [ -d "$f" ] && [ -x "$f" ]; then 
        ((num_of_dirs++))
    fi 
done 

echo "Number of empty files in $K: $num_of_empty_files"
echo "Number of a dirs in $K, that we have access to: $num_of_dirs"