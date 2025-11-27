#!/bin/bash

K1="$1"
K2="$2"

if [[ ! -d "$K1" || ! -d "$K2" ]]; then
    echo "K1 or K2 is not a directory!"
    exit 1
fi

for d in "$K1"/*; do
    if [[ -d "$d" && ! -L "$d" ]]; then
        name=$(basename "$d")

        mv "$d" "$K2"/

        ln -s "$K2/$name" "$K1/$name"
    fi
done
