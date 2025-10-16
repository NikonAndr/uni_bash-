#!/bin/bash 

#check if K1 & K2 are passed as args
if [ $# -ne 2 ]; then 
    echo "ERROR: Pass K1 & K2 as args!"
    exit 1
fi

K1="$1"
K2="$2"

#check if K1 & K2 are directories 
if [ ! -d "$K1" ]; then 
    error "ERROR: K1 is not a directory"
    exit 1
fi

if [ ! -d "$K2" ]; then 
    error "ERROR: K2 is not a directory"
    exit 1
fi

#list all elements before action 
echo "$K1 list of elements"
ls -lh "$K1"
echo "$K2 list of elements"
ls -lh "$K2"

#move command
#add readable on linux (on mac doesn't work)
find "$K1" -maxdepth 1 -type f -exec mv -nv {} "$K2"/ \;

#list all elements after action 
echo "$K1 list of elements"
ls -lh "$K1"
echo "$K2 list of elements"
ls -lh "$K2"
