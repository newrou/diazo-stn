
echo "<html>" > index-auto.html
echo "<head><meta charset=\"utf-8\"/></head>" >> index-auto.html
echo "<body>" >> index-auto.html
echo "<h3>Динамика молекулярных орбиталей:</h3>" >> index-auto.html
echo "<ul>" >> index-auto.html

list=`ls *.png`
for i in $list
do
  name=`basename $i .png`
  echo " <li><a href=\"$i\"> $name </a> </li>" >> index-auto.html
done

echo "</ul>" >> index-auto.html
echo "</body>" >> index-auto.html
echo "</html>" >> index-auto.html
