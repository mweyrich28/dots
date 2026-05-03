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
    

# if [[ $1 ]]; then
#     month=$1
#     worktime=$(sum_time "$month" "/home/malte/documents/zettelkasten/4_atomic_notes/DaiSyBio_WorkDoc.md")
#     year=$(date +%Y)
#     worktime_fopra=$(sum_time $year "/home/malte/documents/personal_wiki/4_atomic_notes/FoPra_Timeline.md")
#     echo "󰥔 WORK ($month): $worktime h | 󰥔 FOPRA: $worktime_fopra h" 
# else
times=""

for i in {2..4}; do
    worktime=$(sum_time "2026-0$i" "/home/malte/documents/zettelkasten/4_atomic_notes/DaiSyBio_WorkDoc.md")
    worktime=${worktime:-0:00}
    times+="$worktime"$'\n'
done

# sum HH:MM → total minutes
total_minutes=$(echo "$times" | awk -F: '
NF==2 {
    h += $1
    m += $2
}
END {
    print h*60 + m
}')

# convert 136:00 → minutes
baseline=102
baseline_minutes=$((baseline * 60))

# subtract
remaining=$((baseline_minutes - total_minutes))

# convert back to HH:MM
h=$((remaining / 60))
m=$((remaining % 60))


month=$1
worktime=$(sum_time "$month" "/home/malte/documents/zettelkasten/4_atomic_notes/DaiSyBio_WorkDoc.md")
year=$(date +%Y)
worktime_fopra=$(sum_time $year "/home/malte/documents/personal_wiki/4_atomic_notes/FoPra_Timeline.md")

# printf "󰥔 REMAINING %d:%02d h| \n" "$h" "$m" 
echo "󰥔 REMAINING (FEB-APR): $h:$m  h | 󰥔 FOPRA: $worktime_fopra h" 
# fi

