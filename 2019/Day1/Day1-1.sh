#!/bin/bash

#MassofFuel=$(cat Input-Day1-1.txt | awk '{m+=int($1/3)-2} END{print m}')

MassofFuel=$(echo 1 | awk '{m+=int($1/3)-2} END{print m}')

echo $MassofFuel | awk 'BEGIN{}
     {
     m=$1;
     n=int($1/3)-2;
     while(n>0){m+=n;temp=int(n/3)-2;n=temp};
     print m
     }'    
          		       

