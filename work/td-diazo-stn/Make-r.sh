#!/bin/bash

cd out
echo -n > ../Diazo-ST.r
list=`ls *-UB3LYP-aug-cc-pVDZ-Singlet.log`
for i in $list
do
  Name=`basename $i -UB3LYP-aug-cc-pVDZ-Singlet.log`
  echo "$Name-USinglet = $Name-UTriplet" >> ../Diazo-ST.r
done
cd ..

cd out
echo -n > ../Diazo-SE.r
list=`ls *-UB3LYP-aug-cc-pVDZ-Doublet.log`
for i in $list
do
  Name=`basename $i -UB3LYP-aug-cc-pVDZ-Doublet.log`
  echo "$Name+-USinglet = $Name-UDoublet" >> ../Diazo-SE.r
  echo "$Name+-UTriplet = $Name-UDoublet" >> ../Diazo-SE.r
done
cd ..

cd out
echo > ../Diazo.list
echo -n > ../Diazo+N2.r
list=`ls *-N2+-UB3LYP-aug-cc-pVDZ-Singlet.log`
for i in $list
do
  Name=`basename $i -N2+-UB3LYP-aug-cc-pVDZ-Singlet.log`
  echo "$Name+-USinglet + N2-USinglet = $Name-N2+-USinglet" >> ../Diazo+N2.r
  echo "$Name+-UTriplet + N2-USinglet = $Name-N2+-USinglet" >> ../Diazo+N2.r
  echo "$Name-UDoublet + N2-USinglet = $Name-N2-UDoublet" >> ../Diazo+N2.r
  echo $Name >> ../Diazo.list
done
cd ..
