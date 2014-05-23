#!/bin/bash
LANG=C
LC_CTYPE=C
FILES_PROCESSED=0
GALERY_FOLDER="$1"
for f in `find $GALERY_FOLDER -type f -path "*/output*" -prune -iname "*.png" -iname "*.PNG" -o -iname "*.jpeg" -o -iname "*.JPEG" -o -iname "*.jpg" -o -iname "*.JPG" -o -iname "*.tiff" -o -iname "*.TIFF" -o -iname "*.gif" -o -iname "*.GIF" -o -iname "*.DIB" -o -iname "*.dib" -o -iname "*.ico" -o -iname "*.ICO" -o -iname "*.cur" -o -iname "*.CUR" -o -iname "*.xbm" -o -iname "*.XBM"`
do
	fileName=`basename $f`
	folderName=`echo "$fileName" | awk -F . '{print $NR}' | awk -F @ '{print $NR}' | awk -F - '{print $NR}'`
	echo “Processing $fileName file …”
	echo "yes" | cp -i "$f" $GALERY_FOLDER/*.xcassets/$folderName.imageset
	let FILES_PROCESSED=FILES_PROCESSED+1
done
echo "Total number of files moved: $FILES_PROCESSED"