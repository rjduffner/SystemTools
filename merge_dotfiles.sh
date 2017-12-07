#!/bin/bash
############################
# Usage ./merge_dotfiles.sh <paths to dotfiles> 
############################

filepaths="$@"
filename=$(basename $1)
echo -n "Backup existing dotfile $filename: to $filename\.original ... "
mv ~/.$filename ~/.$filename\.original 
echo "done"
echo -n "Merge dotfiles into one ... "
cat $filepaths > ~/.$filename
echo "done"
