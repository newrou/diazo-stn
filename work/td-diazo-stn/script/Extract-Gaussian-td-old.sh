#!/bin/bash

list=`ls *.log`
for i in $list
do
 echo "Extract Gaussian file: "`basename $i .log`
 Name=`basename $i .log`.td

 echo -n "E(RB3LYP); "  > $Name
 grep "SCF Done:  E(RB3LYP) =" <$i | tail -n 1 | awk '{print $5}' >> $Name

 echo -n "Zero-point correction; " >> $Name
 grep "Zero-point correction=" <$i | awk '{print $3}' >> $Name

 echo -n "Thermal correction to Energy; " >> $Name
 grep "Thermal correction to Energy=" <$i | awk '{print $5}' >> $Name

 echo -n "Thermal correction to Enthalpy; " >> $Name
 grep "Thermal correction to Enthalpy=" <$i | awk '{print $5}' >> $Name

 echo -n "Thermal correction to Gibbs Free Energy; " >> $Name
 grep "Thermal correction to Gibbs Free Energy=" <$i | awk '{print $7}' >> $Name

 echo -n "Sum of electronic and zero-point Energies; " >> $Name
 grep "Sum of electronic and zero-point Energies=" <$i | awk '{print $7}' >> $Name

 echo -n "Sum of electronic and thermal Energies; " >> $Name
 grep "Sum of electronic and thermal Energies=" <$i | awk '{print $7}' >> $Name

 echo -n "Sum of electronic and thermal Enthalpies; " >> $Name
 grep "Sum of electronic and thermal Enthalpies=" <$i | awk '{print $7}' >> $Name

 echo -n "Sum of electronic and thermal Free Energies; " <$i >> $Name
 grep "Sum of electronic and thermal Free Energies=" <$i | awk '{print $8}' >> $Name

 echo -n "Total CV; " <$i >> $Name
 grep " Total" <$i | head -n 1 | awk '{print $3}' >> $Name

 echo -n "Total S; " <$i >> $Name
 grep " Total" <$i | head -n 1| awk '{print $4}' >> $Name

# sed -e "s/\./\,/" <$Name >$Name.csv
done
