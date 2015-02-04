#!/bin/bash
projlist=`ls -l $1 | grep ^d | awk '{print $9}'`
for proj in ${projlist}
do
    echo ${proj}
    cd $QASRC/${proj}
    git branch
done
