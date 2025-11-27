#!/bin/bash 

K1="$1"
K2="$2"

if [[ ! -d "$K1" || ! -d "$K2" ]]; then
    echo "K1 or K2 is not a directory!"
    exit 1
fi

#create symlink in K1 for every file in K2

for f in "$K2"/*; do
    if [[ -f "$f" ]]; then
        ln -s "$f" "$K1"/
    fi
done