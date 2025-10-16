#!/bin/bash 

#Check If K % P are passed as args
if [ $# -ne 2 ]; then 
    echo "ERROR: Pass K & P as args!"
    exit 1
fi

K="$1"
P="$2"

#Check If K is a directory, P is a file 
if [ ! -d "$K" ]; then
    echo "ERROR: K is not a directory!"
    exit 1
fi

if [ ! -f "$P" ]; then 
    echo "ERROR: P is not a file"
    exit 1
fi

for f in "$K"/*; do 
    if [ -s "$f" ] && [ ! -x "$f" ]; then
        name=$(basename "$f")
        echo "$name" >> "$P"
        rm "$f"
    fi 
done 