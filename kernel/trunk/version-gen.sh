#!/bin/bash

# Copyright (C) KolibriOS team 2024. All rights reserved
# Distributed under terms of the GNU General Public License 

full_ver=$(git describe --tag --long)

version=$(echo $full_ver | cut -d'-' -f1 | cut -c 2-)
offset=$(echo $full_ver | cut -d'-' -f2)
hash=$(echo $full_ver | cut -d'-' -f3 | cut -c 2-)

major=$(echo $version | cut -d'.' -f1)
minor=$(echo $version | cut -d'.' -f2)
patch=$(echo $version | cut -d'.' -f3)

short_ver=$(printf %-14s "$major.$minor.$patch-$offset")

cat > ver_boot.inc << EOF
db      '$short_ver', 13,10,13,10,0
EOF

cat > ver.inc << EOF
        db  $major, $minor, $patch
        db  0
        dw  $offset
.hash   db  '$hash', 0
EOF
