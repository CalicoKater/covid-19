#!/bin/bash
c=0

echo '<table border="1" cellpadding="0" cellspacing="0" width="50%">' > acc.html

for url in `cat airport_quarantine_link_list.txt`; do
#url="https://www.mhlw.go.jp/stf/newpage_10812.html"
  c=$((++c))
  p_key=$c

  
  if [ $c -eq 4 ]; then
    cat no4.html 
    continue
  fi
  # 重複のため削除
  if [ $c -eq 15 || $c -le 5 ]; then 
    continue
  fi
  #patch ni suru?
  #if [ "$c" = "10" ]; then
  #  cat 20200325_desc.csv
  #  continue
  #fi
  #if [ "$c" = "21" ]; then
  #  cat 20200411_desc.csv
  #  continue
  #fi
  curl $url | xmllint --html --xpath '//table/tbody' - \
    |  sed 'y/０１２３４５６７８９（）/0123456789()/' | tr -d '\r'
  #curl $url | xmllint --html --xpath '//table' - | sed -e 's/<[^>]*>//g' | tr -d '\t' \
  #  |  sed 'y/０１２３４５６７８９（）/0123456789()/' | tr -d '\r' > tmp.txt
  # cat tmp.txt | awk -v f_key=$p_key -f ccc.awk > tmp2.txt
  #cat tmp2.txt | tail -n +2

  #debug
  # if [ "$c" = "18" ]; then break ; fi
 done >> acc.html

#done > airport_quarantine_description.csv

echo "</table>" >> acc.html
