
echo "<html>" > index-auto.html
echo "<head><meta charset=\"utf-8\"/></head>" >> index-auto.html
echo "<body>" >> index-auto.html
echo "<h3>Молекулярные орбитали Ph-N<sub>2</sub><sup>+</sup>:</h3>" >> index-auto.html
echo "<ul>" >> index-auto.html

list=`ls MO*`
for name in MO*;
do
  avi=$name/$name.avi
  echo " <li><a href=\"$avi\">$name</a></li> " >> index-auto.html
done

echo "</ul>" >> index-auto.html
echo "</body>" >> index-auto.html
echo "</html>" >> index-auto.html
