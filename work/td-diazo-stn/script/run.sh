
name=`basename $1 .r`
mkdir -p $name
mkdir -p $name/img
mkdir -p $name/mol
mkdir -p $name/out
php reaction-td-gaussian.php -r$name -T"298.15,348.15,353.15,358.15" -b"RB3LYP-aug-cc-pVDZ" > $name.csv
cp $name.csv r.dat
#gnuplot Plot-HSG.gnu
#mv r-298.gif $name/img/$name-298.gif
#mv r-323.gif $name/img/$name-323.gif
#mv r-348.gif $name/img/$name-348.gif
#mv r-373.gif $name/img/$name-373.gif
#mv r-398.gif $name/img/$name-398.gif
rm r.dat
mv $name.csv $name/$name.csv
cp $name.r $name/$name.r

cat $name/$name-ft.html >> $name/$name.html
rm $name/$name-ft.html

mv *.fT $name
#mv *.gif $name/img
cp mol/*.mol $name/mol
cp out/*.log $name/out

#libreoffice $name.csv
