#!/bin/bash

# for input in 0 1 2 3 4 5 6 7 8 9 ;
# do
#     echo "input is $input"
#     awk -v input=$input -f ./Day-5-2.awk < Input-test1.txt
#     awk -v input=$input -f ./Day-5-2.awk < Input-test2.txt
#     awk -v input=$input -f ./Day-5-2.awk < Input-test3.txt
#     awk -v input=$input -f ./Day-5-2.awk < Input-test4.txt
# done;

# for input in 0 1 2 3 4 5 6 7 8 9 ;
# do
#     echo "input is $input"
#     awk -v input=$input -f ./Day-5-2.awk < Input-test5.txt
#     awk -v input=$input -f ./Day-5-2.awk < Input-test6.txt
# done;

# for input in `seq 0 15`;
# do
#     echo "input is $input"
#     awk -v input=$input -f ./Day-5-2.awk < Input-test7.txt
# done;

input=5

awk -v input=$input -f ./Day-5-2.awk < Input-Day-5-1.txt


