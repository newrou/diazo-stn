#!/bin/bash

mkdir -p td
mkdir -p mol

cd out
list=`ls *.log`
for i in $list
do
 echo "Extract Gaussian file: "`basename $i .log`
 Name=../td/`basename $i .log`.td

 echo -n "E0; "  > $Name
 grep "SCF Done:  E(RB3LYP) =" <$i | tail -n 1 | awk '{print $5}' >> $Name

# echo -n "Zero-point correction; " >> $Name
# grep "Zero-point correction=" <$i | awk '{print $3}' >> $Name

# echo -n "Thermal correction to Energy; " >> $Name
# grep "Thermal correction to Energy=" <$i | awk '{print $5}' >> $Name

# echo -n "Thermal correction to Enthalpy; " >> $Name
# grep "Thermal correction to Enthalpy=" <$i | awk '{print $5}' >> $Name

# echo -n "Thermal correction to Gibbs Free Energy; " >> $Name
# grep "Thermal correction to Gibbs Free Energy=" <$i | awk '{print $7}' >> $Name

# echo -n "ZPE; " >> $Name
# grep "Sum of electronic and zero-point Energies=" <$i | awk '{print $7}' >> $Name

# echo -n "Sum of electronic and thermal Energies; " >> $Name
# grep "Sum of electronic and thermal Energies=" <$i | awk '{print $7}' >> $Name

 echo -n "T; " >> $Name
 grep " Temperature" <$i | awk '{print $2}' >> $Name

 echo -n "H; " >> $Name
 grep "Sum of electronic and thermal Enthalpies=" <$i | awk '{print $7}' >> $Name

# echo -n "Total CV; " <$i >> $Name
# grep " Total" <$i | head -n 1 | awk '{print $3}' >> $Name

 echo -n "S; " <$i >> $Name
 grep " Total" <$i | head -n 1| awk '{print 4.1868*$4}' >> $Name

 echo -n "G; " <$i >> $Name
 grep "Sum of electronic and thermal Free Energies=" <$i | awk '{print $8}' >> $Name

 babel -ig09 $i -omol ../mol/`basename $i .log`.mol

# sed -e "s/\./\,/" <$Name >$Name.csv
# mv $Name td
done
