#!/bin/bash
url="https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000121431_00086.html"
curl -s $url | grep "（空港検疫）" | sed 's/<\/div>//g' | xmllint --html --xpath '//a/@href' - \
  | tr ' ' '\n' | grep  -v ^$ | tail -r | cut -d '"' -f 2 > ./var/airport_quarantine_link_list.txt

# delay 2020-08-22
# echo https://www.mhlw.go.jp/stf/newpage_13123.html >> ./var/airport_quarantine_link_list.txt
# delay 2020-08-23 
# echo https://www.mhlw.go.jp/stf/newpage_13128.html >> ./var/airport_quarantine_link_list.txt
# delay 2020-08-29
# echo https://www.mhlw.go.jp/stf/newpage_13270.html >> ./var/airport_quarantine_link_list.txt
# delay 2020-09-12
# echo https://www.mhlw.go.jp/stf/newpage_13535.html >> ./var/airport_quarantine_link_list.txt

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
