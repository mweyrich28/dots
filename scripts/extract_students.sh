#!/usr/bin/bash

zip=$1
dest="Temp"
final_dest="Korrektur"
mkdir $final_dest

# unzip into dest
unzip -q -d $dest "$1"

find $dest -type d -print0 | while IFS= read -r -d '' dir; do
    prefix=$(echo $dir | grep -oP "Arbeitsgruppe \d*")
    prefix=$(echo $prefix| grep -oP "\d*")
    counter=1
    find "$dir" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
        suffix=$(echo "$file" | sed 's/.*\.//')
        echo "MOVING $file -- TO --> $final_dest/$prefix\_$counter.$suffix"
        mv "$file" $final_dest/$prefix\_$counter.$suffix
        counter=$(($counter+1))
    done
done

rm -r $dest
