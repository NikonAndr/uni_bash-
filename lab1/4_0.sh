#!/bin/bash

#check if K1 & K2 are passed as arguments
if [ $# -ne 2 ]; then 
    echo "ERROR: Pass Both K1 & K2 as arguments!"
    exit 1
fi

K1="$1"
K2="$2"

#check if both K1 & K2 are dictionaries 
if [ ! -d "$K1" ]; then 
    echo "ERROR: K1 is not a directory!"
    exit 1
fi 

if [ ! -d "$K2" ]; then 
    echo "ERROR: K2 is not a directory!"
    exit 1
fi 

#list of contents 
echo "------Before mv"
echo "$K1 directory:"
ls -lh "$K1"
echo "$K2 directory:"
ls -lh "$K2"

for f in "$K1"/*; do 
    if [ -f "$f" ] && [ -w "$f" ]; then 
        mv -nv "$f" "$K2"
    fi 
done 

echo "------After mv"
echo "$K1 directory:"
ls -lh "$K1"
echo "$K2 directory:"
ls -lh "$K2"
