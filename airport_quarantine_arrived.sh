#!/bin/bash
tail -n +2 airport_quarantine2.csv | cut -d, -f 1-2 | tr -d "\"" \
  | awk -F, 'split( substr( $2,1,length($2)-12), date ,"(令和|年|月|日)") \
  { printf "%s,%s\n", $1, date[2]+2018}' > report_date_year.tmp

cat airport_quarantine_description.html \
 | sed -e 's/<[^>]*>//g' | tr -d '\t' | awk -f airport_quarantine_arrived.awk > arrived_date.tmp

fname=airport_quarantine_arrived_summary.csv
echo "到着日付, 陽性者数" > $fname

#年またぎの報告と到着が合った場合はパッチが必要！
join -t "," report_date_year.tmp arrived_date.tmp \
  | cut -d, -f 2-3 | tr ',' '/' \
  | sort | uniq -c | awk '{print $2 "," $1}' >> $fname
