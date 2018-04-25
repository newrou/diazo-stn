
#php ./Plot-TD-LUMO.php < Diazo+N2.csv > TD-LUMO.csv
#grep "USinglet" < TD-LUMO.csv > TD-LUMO-USinglet.csv
#grep "UTriplet" < TD-LUMO.csv > TD-LUMO-UTriplet.csv
#grep "UDoublet" < TD-LUMO.csv > TD-LUMO-UDoublet.csv
#gnuplot Plot-TD-LUMO.gnu

cat src/Diazo+N2.csv > src/TD-All.dat
tail -n +2 src/Diazo-ST.csv >> src/TD-All.dat
tail -n +2 src/Diazo-SE.csv >> src/TD-All.dat

php ./Plot-TD-Prop.php < Diazo.list | grep -v "0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;"> TD-Prop.csv
php ./Plot-TD-Prop.php < Diazo-Aliphatic.list | grep -v "0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;"> TD-Prop-Aliphatic.csv
php ./Plot-TD-Prop.php < Diazo-Getero.list | grep -v "0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;"> TD-Prop-Getero.csv
php ./Plot-TD-Prop.php < Diazo-NO-Pyridine.list | grep -v "0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;"> TD-Prop-NO-Pyridine.csv
php ./Plot-TD-Prop.php < Diazo-Phenil.list | grep -v "0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;"> TD-Prop-Phenil.csv
php ./Plot-TD-Prop.php < Diazo-Pyridine.list | grep -v "0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;"> TD-Prop-Pyridine.csv

# Make Graph
#~/Soft/gnuplot-5.2.2/src/gnuplot Plot-TD-Prop.gnu
gnuplot Plot-TD-Prop.gnu

list=`ls *.html`
for i in $list
do
  echo "Make-Legend $i"
  php Make-Legend.php < $i | sed -e 's/\/usr\/share\/gnuplot\/gnuplot\/5.0\///' > tmp.html
  mv tmp.html $i
done

mkdir -p Graph
mv *.html Graph
mv *.gif Graph
mv TD-*.csv Graph

# Make Table
#grep "N2\+" < Table-TD-ST.dat > Table-TD-ST-+N2.csv
#grep -v "N2\+" < Table-TD-ST.dat > Table-TD-ST-+.csv
php ./Table-TD-Prop.php < Diazo.list
php ./csv-2-html.php -t "Ar+ + N2 = Ar-N2+" < Table/Table-TD-Nitriding.csv > Table/Table-TD-Nitriding.html
php ./csv-2-html.php -t "Ar+ + e = Ar." < Table/Table-TD-SE-Ar+.csv  > Table/Table-TD-SE-Ar+.html
php ./csv-2-html.php -t "Ar-N2+ + e = Ar-N2." < Table/Table-TD-SE-Ar-N2+.csv  > Table/Table-TD-SE-Ar-N2+.html
php ./csv-2-html.php -t "Ar+(S) = Ar+(T)" < Table/Table-TD-ST-Ar+.csv  > Table/Table-TD-ST-Ar+.html
php ./csv-2-html.php -t "Ar-N2+(S) = Ar-N2+(T)" < Table/Table-TD-ST-Ar-N2+.csv > Table/Table-TD-ST-Ar-N2+.html

#firefox *.html
