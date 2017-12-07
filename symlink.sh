#!/bin/bash
############################
# Usage ./symlink.sh <full-path-to-dotfile>
############################

# Variables
filepaths="$@"

for filepath in $filepaths; do
    filename=$(basename $filepath)
    echo -n "Backup existing dotfile $filename: to $filename\.original ... "
    mv ~/.$filename ~/.$filename\.original 
    echo "done"
    echo -n "Creating symlink to $filename in home directory ... "
    ln -s $filepath ~/.$filename
    echo "done"
done
