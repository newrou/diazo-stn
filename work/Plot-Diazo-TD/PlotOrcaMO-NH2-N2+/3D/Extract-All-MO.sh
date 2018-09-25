
Name=$1
for MO in $(seq 1 87)
do
  NMO=$(( $MO - 1 ))
  echo "MO=$MO NMO=$NMO"
  mkdir -p $Name/MO$MO
  for Step in $(seq --equal-width 1 800)
  do
    echo "   Step=$Step"
    cat get-mo.com | sed -e "s/MO/$NMO/" | ./orca_plot $Name/gbw/$Name-scan-d09-169-n800.$Step.gbw -i | tee get-mo.log > /dev/null
    mv NH2-N2+-scan-d09-169-n800.mo"$NMO"a.cube $Name/MO$MO/MO$MO-$Step.cube
    rm NH2-N2+-scan-d09-169-n800.mo"$NMO"b.cube
  done
done
