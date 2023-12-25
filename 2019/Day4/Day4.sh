#!/bin/bash

echo "" | gawk -v n1=$1 -v n2=$2 -f Day4.awk
