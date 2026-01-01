#!/bin/bash

name="$1"

DIRS="
$HOME/.local/share/applications
"
# /usr/share/applications

DIRS="$DIRS ${XDG_DATA_DIRS//:/$'\n'}"

# IFS=:
# DIRS=$XDG_DATA_DIRS
for d in $DIRS; do
    [ -d "$d" ] || continue
    #echo "=== $d"
    find $d -iname "*$name*.desktop"
done | grep -i "$name" --color
