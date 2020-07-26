#!/bin/bash
url="https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000121431_00086.html"
curl -s $url | grep -n "（空港検疫）" | xmllint --html --xpath '//a/@href' - \
  | tr ' ' '\n' | grep  -v ^$ | tail -r | sed "s/\"//g" \
  | cut -d '=' -f2 > ./var/airport_quarantine_link_list.txt

for url in `cat ./var/airport_quarantine_link_list.txt`; do  

   date=`curl -s $url |  grep 'm-boxInfo__date' | sed -e 's/<[^>]*>//g'` 
   date=`echo $date | tr -d '\r'`                                  

   msg=`curl -s $url | grep 'が報告されました' | sed -e 's/<[^>]*>//g'` 
   msg=`echo $msg | tr -d '\r'` 
   msg=`echo $msg | sed "s/&#160;//g" | sed "s/^　//g"` 
   
   echo "\"$date\"","\"$url\"","\"$msg\""
   
done > airport_quarantine.csv

cat airport_quarantine.csv | tr -d '\"' | sed 'y/０１２３４５６７８９/0123456789/' \
  | awk -F',' -f ./src/airport_quarantine.awk > airport_quarantine2.csv
