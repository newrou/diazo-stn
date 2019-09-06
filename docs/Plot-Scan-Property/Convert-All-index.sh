#!/bin/bash

sdir=`pwd`
Name=`basename $sdir`

echo "<html><body>" > index.html
echo "<h3>$Name</h3>" >> index.html

list=`find . -maxdepth 1 -mindepth 1 -type d -printf "%f\n"`
for i in $list
do
    Name=`basename $i`
    echo "Catalog: [$Name]"
    echo "<p><a href=\"$Name/index.html\">$Name</a></p>" >> index.html

    cp Convert-All-index.sh $i
    cd $i
    ./Convert-All-index.sh
    rm ./Convert-All-index.sh
    cd ..
done

# for i in *.svg; do
l=`ls *.svg`
for i in $l
do
    img=`basename "$i" .svg`
    echo "  [$img]"
    echo "<p><img src=\"$img.svg\" width=\"800\" /></p>" >> index.html
done

echo "</body></html>" >> index.html
