#!/usr/bin/bash

sum_time() {
    grep "$1" "$2" \
    | cut -d">" -f2 \
    | sed 's/^ *//;s/ *$//' \
    | awk -F":" '
        /^[0-9]+:[0-9]+$/ {
            h += $1
            m += $2
        }
        END {
            h += int(m / 60)
            m = m % 60
            printf("%d:%02d\n", h, m)
        }'
}
    

if [[ $1 ]]; then
    month=$1
    worktime=$(sum_time "$month" "/home/malte/documents/zettelkasten/4_atomic_notes/DaiSyBio_WorkDoc.md")
    year=$(date +%Y)
    echo "󰥔 WORK ($month): $worktime h" 
else
    times=""
    
    for i in {5..0}; do
        month=$(date -d "-$i month" +%Y-%m)
        worktime=$(sum_time "$month" "/home/malte/documents/zettelkasten/4_atomic_notes/DaiSyBio_WorkDoc.md")

        worktime=${worktime:-0:00}

        echo "  $month: $worktime h"
        times+="$worktime"$'\n'
    done

    total=$(echo "$times" | awk -F":" '
        /^[0-9]+:[0-9]+$/ {
            h += $1
            m += $2
        }
        END {
            h += int(m / 60)
            m = m % 60
            printf("%d:%02d\n", h, m)
        }')

    echo "󰥔 TOTAL (6 months): $total h"
fi

