#!/bin/bash

chem=$1;
chem2=$2;
filename="";

for file in $chem*; do
    filename=`echo $file | awk -F '/' '{print $3}'`;
    echo -e "-------------------------------------------------------------$filename";
    diff $file $chem2$filename;
    echo -e "-------------------------------------------------------------"
done
