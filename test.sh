#!/bin/bash
c=0
output=airport_quarantine_description.html

echo '<table border="1"'> $output
# 書式が異なるので焼き直し
cat no_1_7.html >> $output

for url in `cat airport_quarantine_link_list.txt`; do
#url="https://www.mhlw.go.jp/stf/newpage_10812.html"
  c=$((++c))
  p_key=$c

  # 焼き直し分をスキップ
  if [ $c -le 5 ]; then
    continue
  fi

  # 重複のため削除
  #if [ $c -eq 15 ] ; then 
  #  continue
  #fi

  # 行数が異なるため焼き直し
  if [ $c -eq 21 ]; then
    cat no_21.html 
    continue
  fi

  # 画像ファイルのため焼き直し
  if [ $c -eq 74 ]; then
    cat no_74.html 
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
 done >> $output

#done > airport_quarantine_description.csv

echo "</table>" >> $output

