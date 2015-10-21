#!/bin/bash
############################
# Usage ./symlink.sh <full-path-to-dotfile>
############################

# Variables
dir=~/dotfiles/files
filepaths="$@"
hostname=`hostname -s`
username=`whoami`

# create dotfiles_old in homedir
if [ ! -d "$olddir" ]; then
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ... "
    mkdir -p $olddir
    echo "done"
fi

for filepath in $filepaths; do
    filename=$(basename $filepath)
    echo -n "Backup existing dotfile $filename: to $filename\.original ... "
    mv ~/.$filename ~/.$filename\.original 
    echo "done"
    echo -n "Creating symlink to $filename in home directory ... "
    ln -s $filepath ~/.$filename
    echo "done"
done
