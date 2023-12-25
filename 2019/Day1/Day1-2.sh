#!/bin/bash

awk '{print int($1/3)-2}' Input-Day1-1.txt > MassofFuel.txt

awk 'BEGIN{total=0}
    {m=$1;
     n=int($1/3)-2;
     while(n>0){m+=n;temp=int(n/3)-2;n=temp};
     total+=m}
     END{print total}' MassofFuel.txt



          		       

