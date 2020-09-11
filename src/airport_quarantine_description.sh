#!/bin/bash
c=0
output=airport_quarantine_description.html

echo '<table border="1">'> $output
# 書式が異なるので焼き直し
cat ./var/no_1_7.html >> $output

for url in `cat ./var/airport_quarantine_link_list.txt`; do
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
    cat ./var/no_21.html 
    continue
  fi

  # 画像ファイルのため焼き直し
  if [ $c -eq 74 ]; then
    cat ./var/no_74.html 
    continue
  fi
  # 死亡事例が含まれるためパッチ
  if [ $c -eq 76 ]; then
    cat ./var/no_76.html
    continue
  fi

  # 二重のtable タグのため差し替え
  if [ $c -eq 153 ]; then
     #grep -v "table" ./var/no_826_828.html
     curl $url | xmllint --html --xpath '//table/tbody/tr/td/table/tbody' - \
    |  sed 'y/０１２３４５６７８９（）/0123456789()/' | tr -d '\r'
    continue
  fi

  curl $url | xmllint --html --xpath '//table/thead' - \
    |  sed 'y/０１２３４５６７８９（）/0123456789()/' | tr -d '\r'
  curl $url | xmllint --html --xpath '//table/tbody' - \
    |  sed 'y/０１２３４５６７８９（）/0123456789()/' | tr -d '\r'

  #debug
  #if [ $c -eq 76 ]; then 
  #  echo $url
  #  break
  #fi
 done >> $output

echo "</table>" >> $output

