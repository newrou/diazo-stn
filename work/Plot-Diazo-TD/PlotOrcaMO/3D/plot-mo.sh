
name=`basename $1 .gbw`
cat get-mo.com | sed -e "s/MO/$2/" | ./orca_plot $1 -i > get-mo.log
mv Ph-N2+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.mo"$2"a.cube mo.cube
rm Ph-N2+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.mo"$2"b.cube
mv Ph-N2+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.xyz mol.xyz
pymol -c plot-mo.pml
mv mo.png $1-mo$2.png
eom $1-mo$2.png
