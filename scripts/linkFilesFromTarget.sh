#!/bin/bash

if [ $# -lt 3 ]; then
	echo $0 targetFile sourceFolder destFolder
	exit 1
fi

targetFile=$1
sourceFolder=$2
destFolder=$3

filenames=`cuta.py -f.FileName $targetFile | awk 'FNR>1'`

for filename in ${filenames[@]}; do
	
	if [ -e "$sourceFolder/$filename" ]; then
		echo linking $filename
		ln "$sourceFolder/$filename" "$destFolder/$filename"
	else
		#head "$sourceFolder/$filename"
		echo $sourceFolder/$filename does not exist. skip
	fi
done