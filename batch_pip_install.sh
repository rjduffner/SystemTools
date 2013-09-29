#!/bin/bash
#
#	author: robertd
#	date Septemer 21, 2013
#	An easier way to install
#
COUNTER=0
for PACKAGE in `comm -23 <(cat $1 | grep "==" | sed "s/^\(.*\)\(==\).*$/\1/") <(pip freeze | grep "==" | sed "s/^\(.*\)\(==\).*$/\1/")`
do
	echo $PACKAGE
	if [ "$2" = "install" ]; then
	sudo pip install $PACKAGE
	fi
	let COUNTER=COUNTER+1
done

echo found ${COUNTER} packages