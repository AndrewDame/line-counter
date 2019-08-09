#!/bin/sh
#Andrew Dame, 09/24/18, linecount.sh
count=0 
files=""

#find all directories present in the current directory
directories=`find . -type d` 
for a in $directories;
do
	cd $a
	
	if [ $# = 0 ]; #no specified pattern
	then 
	        files=`find . -maxdepth 1 -type f`	
	else
		files=`find . -maxdepth 1 -type f -name $1`
	fi

	
	for b in $files;
	    do
	    file_count=`cat $b | wc -l`
	    count=$(($count + $file_count))
	    done
	cd - > /dev/null #change back to previous directory
	
done

echo "There are $count line(s) in this directory"

