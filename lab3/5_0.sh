#!/bin/bash

P="$1"

tr '#' '\n' < "$P" | while IFS= read -r line; do 
    [ -z "$line" ] && continue

    set -- $line
    first=$1

    ss=$(echo "$first" | cut -d'-' -f1)
    mm=$(echo "$first" | cut -d'-' -f2)
    hh=$(echo "$first" | cut -d'-' -f3)

    if [ "$hh" -lt 12 ]; then
        period="am"
    else
        period="pm"
    fi

    h12=$(expr $hh % 12)
    [ "$h12" -eq 0 ] && h12=12

    newtime="$h12:$(printf "%02d" "$mm") $period"

    shift 
    echo "$newtime $*"
done


