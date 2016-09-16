#!/usr/bin/env bash
set -x

bd=$(dirname "${BASH_SOURCE[0]}")
for d in $( find $bd -type d | grep -v ".git" | sed "s|$bd/*||g" | grep -vE '^$'); do 
    mkdir -p $d 
done

dd=$(readlink -f .)
for f in $(find $bd -type f | grep -v '.git' | grep -v 'Documents'); do 
    dst_f=$(echo $f | sed "s|^$bd|$dd|g")
    ln -s $f $dst_f
done
