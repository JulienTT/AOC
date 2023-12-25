#!/bin/bash
bool=0;

for noun in `seq 0 99`;
do
    for verb in `seq 0 99`;
    do
	sol=$(awk -v noun=$noun -v verb=$verb -f ./Day-2-2.awk < Day-2-1-Input.txt);
	if [ $sol = 19690720 ]
	then
	    echo "$noun $verb"
	    echo "$noun $verb" | awk '{print 100*$1+$2}';
	    break 2
	fi
    done;
done;

echo "$noun $verb"
