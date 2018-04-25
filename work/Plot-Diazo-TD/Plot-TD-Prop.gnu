set terminal canvas enhanced mousing rounded size 1200,800 jsdir "js" fsize 10 lw 1.6 fontscale 1 
set size ratio 1.1 1,1
set key right top vertical Right noreverse enhanced autotitle nobox
set bars small
unset arrow 1
set label "* N_2" at -0.43847,0 left font "Helvetica,14"
set key autotitle columnhead
set datafile separator ";"

set style line 1 lt 1 pt 5 ps 1.0 lc rgb "#CC6600"
set style line 2 lt 2 pt 5 ps 1.0 lc rgb "#FF0033"
set style line 3 lt 3 pt 5 ps 1.0 lc rgb "#0033FF"
set style line 4 lt 4 pt 5 ps 1.0 lc rgb "#3399CC"
set style line 5 lt 5 pt 5 ps 1.0 lc rgb "#33CC66"
set style line 6 lt 6 pt 5 ps 1.0 lc rgb "#3333CC"
set style line 7 lt 7 pt 5 ps 1.0 lc rgb "#333333"

set style arrow 1 nohead ls 2 lw 1.5 lc black


unset label
set xlabel "EA, kJ/mol" font "Helvetica-Bold,14"
set ylabel "dE0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-EA.html"
plot "TD-Prop-Aliphatic.csv" using 3:2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using 3:2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using 3:2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using 3:2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using 3:2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xlabel "dE(ST), kJ/mol" font "Helvetica-Bold,14"
set ylabel "dE0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-dE(ST).html"
plot "TD-Prop-Aliphatic.csv" using 4:2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using 4:2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using 4:2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using 4:2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using 4:2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


#set xrange [1.300:1.500]
#set yrange [-300:300]
set xlabel "d(C-N)min, A" font "Helvetica-Bold,14"
set ylabel "dE0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-d(C-N).html"
plot "TD-Prop-Aliphatic.csv" using 22:2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using 22:2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using 22:2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using 22:2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using 22:2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xlabel "d(N-N)min, A" font "Helvetica-Bold,14"
set ylabel "dE0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-d(N-N).html"
plot "TD-Prop-Aliphatic.csv" using 23:2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using 23:2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using 23:2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using 23:2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using 23:2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xlabel "d(C-N)/d(N-N)" font "Helvetica-Bold,14"
set ylabel "dE0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-d(C-N)-fraq-d(N-N).html"
plot "TD-Prop-Aliphatic.csv" using ($22/$23):2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using ($22/$23):2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using ($22/$23):2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using ($22/$23):2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using ($22/$23):2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xlabel "d(C-N) - d(N-N)" font "Helvetica-Bold,14"
set ylabel "dE0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-d(C-N)-d(N-N).html"
plot "TD-Prop-Aliphatic.csv" using ($22-$23):2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using ($22-$23):2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using ($22-$23):2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using ($22-$23):2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using ($22-$23):2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xlabel "d(C-N) + d(N-N)" font "Helvetica-Bold,14"
set ylabel "dE0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-d(C-N)+d(N-N).html"
plot "TD-Prop-Aliphatic.csv" using ($22+$23):2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using ($22+$23):2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using ($22+$23):2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using ($22+$23):2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using ($22+$23):2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xrange [-0.2:0.1]
set yrange [-300:300]
set xlabel "LUMO(Ar^+)-LUMO(Ar-N _2^+), kJ/mol" font "Helvetica-Bold,14"
set ylabel "dE_0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-LUMO+(S)-LUMO_N2+(S).html"
plot "TD-Prop-Aliphatic.csv" using ($9-$32):2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using ($9-$32):2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using ($9-$32):2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using ($9-$32):2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using ($9-$32):2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xrange [-0.08:0.06]
set yrange [-80:100]
set xlabel "LUMO(Ar^.)-LUMO(Ar-N _2^.), kJ/mol" font "Helvetica-Bold,14"
set ylabel "dE_0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-LUMO(D)-LUMO_N2(D).html"
plot "TD-Prop-Aliphatic.csv" using ($13-$36):38:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using ($13-$36):38:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using ($13-$36):38:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using ($13-$36):38:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using ($13-$36):38:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xrange [1.200:1.700]
set yrange [1.050:1.300]
set xlabel "d(C-N), A" font "Helvetica-Bold,14"
set ylabel "d(N-N), A" font "Helvetica-Bold,14"
set output "d(C-N)-f-d(N-N).html"
plot "TD-Prop.csv" using 16:17:1 with labels hypertext point linestyle 1 ti "Singlet", \
 "TD-Prop.csv" using 18:19:1 with labels hypertext point linestyle 2 ti "Triplet", \
 "TD-Prop.csv" using 20:21:1 with labels hypertext point linestyle 3 ti "Doublet", \
 "TD-Prop.csv" using 22:23:1 with labels hypertext point linestyle 4 ti "Minimal"


set xrange [-300:300]
set yrange [-300:300]
set xlabel "EA(Ar^+)-EA(Ar-N _2^+), kJ/mol" font "Helvetica-Bold,14"
set ylabel "dE_0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-EA(Ar+)-EA(Ar-N2+).html"
plot "TD-Prop.csv" using ($24-$26):2:1 with labels hypertext point linestyle 1 ti "Singlet-Singlet", \
     "TD-Prop.csv" using ($25-$27):2:1 with labels hypertext point linestyle 2 ti "Triplet-Triplet", \
     "TD-Prop.csv" using ($25-$26):2:1 with labels hypertext point linestyle 3 ti "Triplet-Singlet", \
     "TD-Prop.csv" using ($3-$26):2:1 with labels hypertext point linestyle 4 ti "Minimal-Singlet"


#set xrange [-0.7:0.2]
#set yrange [-300:300]
set xrange [-0.1:0.35]
set yrange [-300:300]
set xlabel "LUMO-HOMO, kJ/mol" font "Helvetica-Bold,14"
set ylabel "dE_0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-LUMO-HOMO.html"
plot "TD-Prop.csv" using ($9-$10):2:1 with labels hypertext point linestyle 1 ti "Singlet-Singlet", \
     "TD-Prop.csv" using ($11-$12):2:1 with labels hypertext point linestyle 2 ti "Triplet-Triplet", \
     "TD-Prop.csv" using ($13-$14):2:1 with labels hypertext point linestyle 3 ti "Doublet-Doublet"


set xrange [-0.8:0]
set yrange [-300:300]
set xlabel "HOMO, kJ/mol" font "Helvetica-Bold,14"
set ylabel "dE_0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-HOMO.html"
plot "TD-Prop.csv" using 10:2:1 with labels hypertext point linestyle 1 ti "Singlet", \
     "TD-Prop.csv" using 12:2:1 with labels hypertext point linestyle 2 ti "Triplet", \
     "TD-Prop.csv" using 14:2:1 with labels hypertext point linestyle 3 ti "Doublet"


set xrange [-0.6:-0.3]
set yrange [-300:300]
set xlabel "E(LUMO), Hartree" font "Helvetica-Bold,14"
set ylabel "dE_0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-LUMO_min.html"
plot "TD-Prop-Aliphatic.csv" using 8:2:1 with labels hypertext point linestyle 1 ti "Aliphatic", \
 "TD-Prop-Getero.csv" using 8:2:1 with labels hypertext point linestyle 2 ti "Getero", \
 "TD-Prop-Phenil.csv" using 8:2:1 with labels hypertext point linestyle 3 ti "Phenil", \
 "TD-Prop-Pyridine.csv" using 8:2:1 with labels hypertext point linestyle 4 ti "Pyridine", \
 "TD-Prop-NO-Pyridine.csv" using 8:2:1 with labels hypertext point linestyle 5 ti "NO-Pyridine"


set xrange [-0.2:0.1]
set yrange [-300:300]
set xlabel "LUMO(Ar^+)-LUMO(Ar-N _2^+), kJ/mol" font "Helvetica-Bold,14"
set ylabel "dE_0, kJ/mol" font "Helvetica-Bold,14"
set output "dE0-f-LUMO-LUMO_N2.html"
plot "TD-Prop.csv" using ($9-$32):2:1 with labels hypertext point linestyle 1 ti "Singlet-Singlet", \
     "TD-Prop.csv" using ($11-$34):2:1 with labels hypertext point linestyle 2 ti "Triplet-Triplet", \
     "TD-Prop.csv" using ($11-$32):2:1 with labels hypertext point linestyle 3 ti "Triplet-Singlet", \
     "TD-Prop.csv" using ($8-$32):2:1 with labels hypertext point linestyle 5 ti "Minimal-Singlet"


quit
