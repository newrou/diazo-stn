#!/bin/bash

#php ./ExtractOrcaMO.php <$1 >`basename $1 .out`.mo

php ./ExtractOrcaMO2.php <Ph-N2+.out > Ph-N2+.mo
mv ExtractOrcaMO.mo Ph-N2+.rmo
grep "\@" <ExtractOrcaMO.log | sed -e "s/\@;//" > test.mo
grep -v "\@" <ExtractOrcaMO.log | grep -v "Test" > test2.log

gnuplot PlotOrcaMO2.gnu
