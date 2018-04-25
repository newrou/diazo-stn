#!/bin/bash

cd out
list=`ls *.log`
for i in $list
do
  Name=`basename $i .log`
  Neg=`grep " Frequencies --" < $i | awk '{printf "%f\n%f\n%f\n", $3, $4, $5}' | grep "\-" | wc -l`
  if [[ $Neg == "0" ]] ; then 
    echo Convert [$Name]
    mkdir -p ../mol
    babel -ig09 $i -omol > ../mol/$Name.mol
  else
    echo Not optimized [$Name]
    mkdir -p ../cont
    cp $i ../cont
  fi
done

cd ..
