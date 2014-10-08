#!/bin/bash

function check_for_existing {
    if [ -f $1 ]
    then
        return 1
    else
        return 0
    fi
}
function append_or_overwrite {
echo "Press y to overwrite existing profile"
read -n 1 -r
echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then 
        echo "Copying Profile"
        cp $1 $2
    elif [[ $REPLY =~ ^[Aa]$ ]]
        then
        echo "appending profile to existing profile"
        cat $1 >> $2
    else
        echo "Not Copying Profile"
    fi
}

function copy_file {
    check_for_existing $2
    if [[ $? -eq 1 ]]
    then
        append_or_overwrite $1 $2
    else
        cp $1 $2
    fi
}


copy_file resources/vimrc ~/.vimrc 
copy_file resources/bash_profile ~/.bash_profile
