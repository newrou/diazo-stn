#!/bin/bash

#php ./ExtractOrcaMO.php < src/N2.out > N2.mo
#php ./ExtractOrcaMO.php < src/NH2+.out > NH2+.mo
#php ./ExtractOrcaMO.php < src/NH2-N2+-n800.out > NH2-N2+-n800.mo
cp ExtractOrcaMO.mo NH2-N2+.rmo
cp ExtractOrcaMO.map NH2-N2+.map

#gnuplot PlotOrcaMO.gnu
