#!/bin/bash
#
#	author: robertd
#	date June 13, 2014
#

home=`pwd`
projlist=`ls -l $home | grep ^d | awk '{print $9}'`
for proj in ${projlist}
do
    cd $home/${proj}
    if [ -d ".git" ]; then
        branch=`git rev-parse --abbrev-ref HEAD`
        printf "%-30s | %-30s\n" ${proj} ${branch} 
    fi
done
