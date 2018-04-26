#!/bin/bash

#php ./ExtractOrcaMO.php <$1 >`basename $1 .out`.mo

#php ./ExtractOrcaMO.php < src/N2.out > N2.mo
#php ./ExtractOrcaMO.php < src/Ph+.out > Ph+.mo
#php ./ExtractOrcaMO.php < src/Ph-N2+.out > Ph-N2+.mo

#php ./ExtractOrcaMO.php < src/N2-n800.out > N2-n800.mo
#php ./ExtractOrcaMO.php < src/Ph+-n800.out > Ph+-n800.mo
#php ./ExtractOrcaMO.php < src/Ph-N2+-scan-d090-169-n800.out > Ph-N2+-scan-n800.mo

#mv ExtractOrcaMO.mo Ph-N2+-800.rmo

php ./ExtractOrcaMO.php < src/Ph-N2+.out > Ph-N2+.mo
mv ExtractOrcaMO.mo Ph-N2+.rmo
#php ./ExtractOrcaMO.php < src/Ph-N2+-scan-d090-169-n800.out > Ph-N2+-n800.mo
#mv ExtractOrcaMO.mo Ph-N2+-n800.rmo

gnuplot PlotOrcaMO.gnu
