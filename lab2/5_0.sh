#!/bin/bash

K="$1"
P="$2"

if [[ ! -d "$K" || ! -f "$P" ]]; then
    echo "K is not a directory or P is not a file"
    exit 1
fi

K_path=$(readlink -f "$K")
P_path=$(readlink -f "$P")

P_name=$(basename "$P_path")

rel_path=$(realpath --relative-to="$K_path" "$P_path")

ln -s "$rel_path" "$K_path/$P_name"