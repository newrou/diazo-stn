
#ffmpeg -f image2 -i *.png -qscale 0 -y -an -r 48 all.flv
cd $1/$2
rm $2.avi
ffmpeg -y -an -r 5 -i "$2-%03d.png" $2.avi -qscale 1 
cd ../..
