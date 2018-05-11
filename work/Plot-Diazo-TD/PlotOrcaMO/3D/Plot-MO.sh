
Name=$1
RO=$2
MO=$3
NMO=$(( $MO - 1 ))
echo "NMO=$NMO"
N=$4
TXT=$5
STAT=$6
mkdir -p $Name/MO$RO
cat get-mo.com | sed -e "s/MO/$NMO/" | ./orca_plot $Name/gbw/$Name-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.$N.gbw -i | tee get-mo.log
mv Ph-N2+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.mo"$NMO"a.cube mo.cube
rm Ph-N2+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.mo"$NMO"b.cube
cp $Name/gbw/Ph-N2+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.$N.xyz mol.xyz
#pymol -c plot-mo.pml
#convert -pointsize 16 -fill black -draw "text 40,40 \"$TXT\"" mo.png mo-txt.png
#mv mo-txt.png $Name/MO$RO/MO$RO-$N.png
echo -n $STAT >> $Name/MO$RO/MO$RO-stat.dat
php IntegrateGaussianCube.php mo.cube >> $Name/MO$RO/MO$RO-stat.dat
rm mo.cube
rm mo.png
rm mol.xyz
rm Ph-N2+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.xyz