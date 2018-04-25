
set terminal pngcairo  transparent enhanced font "arial,32" fontscale 1.0 size 2000,2000
set output "Ph-N2+-scan-n800-more.png"
set multiplot
set xrange [0.9:18.5]
set yrange [-1.5:0.0]
set xlabel "Distance C-N, A" font "Helvetica-Bold,30"
set ylabel "E, Hartree" font "Helvetica-Bold,30"
set label "Ph-N_2^+" at 15.0,-1.2 left font "Helvetica,28"
set label "Ph^+" at 16.8,-1.2 left font "Helvetica,28"
set label "N_2" at 17.7,-1.2 left font "Helvetica,28"
do for [i=5:31:1] { plot 'Ph-N2+-scan-n800.mo' using 1:i with lines ls 2 lw 3 notitle }
do for [i=32:228:1] { plot 'Ph-N2+-scan-n800.mo' using 1:i with lines ls 1 lw 3 notitle }
do for [i=5:24:1] { plot 'Ph+-n800.mo' using 1:i with lines ls 2 lw 3 notitle }
do for [i=25:182:1] { plot 'Ph+-n800.mo' using 1:i with lines ls 1 lw 3 notitle }
do for [i=5:11:1] { plot 'N2-n800.mo' using 1:i with lines ls 2 lw 3 notitle }
do for [i=12:45:1] { plot 'N2-n800.mo' using 1:i with lines ls 1 lw 3 notitle }
#plot 'Ph-N2+-scan-n800.mo' using 1:($2+341.0) with lines ls 3 lw 3 ti "dE, Hartree"
unset multiplot

set terminal pngcairo  transparent enhanced font "arial,32" fontscale 1.0 size 4000,2000
set output "Ph-N2+-n800-rmo.png"
set multiplot
set xrange [0.9:18.5]
set yrange [-1.5:-0.4]
set xlabel "Distance C-N, A" font "Helvetica-Bold,30"
set ylabel "E, Hartree" font "Helvetica-Bold,30"
unset label
set label "Ph-N_2^+" at 16.2,-1.2 left font "Helvetica,30"
set label "Ph^+" at 17.1,-1.2 left font "Helvetica,30"
set label "N_2" at 17.6,-1.2 left font "Helvetica,30"
do for [i=5:31:1] { plot 'Ph-N2+-n800.rmo' using 1:i with lines ls i lw 3 notitle }
#do for [i=32:228:1] { plot 'Ph-N2+-n800.rmo' using 1:i with lines ls 1 lw 3 notitle }
do for [i=5:24:1] { plot 'Ph+-n800.mo' using 1:i with lines ls 2 lw 3 notitle }
do for [i=25:182:1] { plot 'Ph+-n800.mo' using 1:i with lines ls 1 lw 3 notitle }
do for [i=5:11:1] { plot 'N2-n800.mo' using 1:i with lines ls 2 lw 3 notitle }
do for [i=12:45:1] { plot 'N2-n800.mo' using 1:i with lines ls 1 lw 3 notitle }
#plot 'Ph-N2+-scan-n800.mo' using 1:($2+341.0) with lines ls 3 lw 3 ti "dE, Hartree"
unset multiplot

quit

