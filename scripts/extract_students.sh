#!/usr/bin/bash

zip=$1
name=$2

# abort if no name 
if [ -z "$name" ]; then
    echo "No dir name given"
    exit 1
fi

dest="Temp"
final_dest="Korrektur"
mkdir $final_dest
mkdir ~/OneDriver/01_Studium/Hiwi/WS_2024/$name

# unzip into dest
unzip -q -d $dest "$1"

find $dest -type d -print0 | while IFS= read -r -d '' dir; do
    prefix=$(echo $dir | grep -oP "Arbeitsgruppe \d*")
    prefix=$(echo $prefix| grep -oP "\d*")
    counter=1
    find "$dir" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
        suffix=$(echo "$file" | sed 's/.*\.//')
        echo "MOVING $file -- TO --> $final_dest/$prefix\_$counter.$suffix"
        mv "$file" $final_dest/Gruppe\_$prefix\_$counter.$suffix
        counter=$(($counter+1))
    done
done

rm -r $dest

mv Korrektur ~/OneDriver/01_Studium/Hiwi/WS_2024/$name
