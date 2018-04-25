

set terminal pngcairo  transparent enhanced font "arial,28" fontscale 1.0 size 3000,3000
set output "Ph-N2+-RMO-all.png"
set multiplot
set xrange [0.9:6.5]
set yrange [-1.5:-0.4]
set label "Ph-N_2^+" at 4.7,-1.5 left font "Helvetica,28"
set label "Ph^+" at 5.2,-1.5 left font "Helvetica,28"
set label "N_2" at 5.6,-1.5 left font "Helvetica,28"
do for [i=5:31:1] { plot 'Ph-N2+.rmo' using 1:i with points ls i lw 2.0 pt 0 ps 0.5 notitle }
do for [i=32:228:1] { plot 'Ph-N2+.rmo' using 1:i with points ls i lw 0.2 pt 0 ps 0.1 notitle }
do for [i=5:24:1] { plot 'Ph+.mo' using 1:i with lines ls 2 lw 0.5 notitle }
do for [i=25:182:1] { plot 'Ph+.mo' using 1:i with lines ls 1 lw 0.5 notitle }
do for [i=5:11:1] { plot 'N2.mo' using 1:i with lines ls 2 lw 0.5 notitle }
do for [i=12:45:1] { plot 'N2.mo' using 1:i with lines ls 1 lw 0.5 notitle }
unset multiplot


set terminal pngcairo  transparent enhanced font "arial,32" fontscale 1.0 size 3000,3000
set output "test.png"
set multiplot
set xrange [0.9:6.5]
set yrange [-0.8:-0.5]
do for [i=2:7:1] { plot 'test.mo' using 1:i with points ls i lw 2.0 pt 6 ps 0.5 notitle }
unset multiplot


quit
