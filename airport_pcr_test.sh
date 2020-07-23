curl -s https://www.mhlw.go.jp/content/current_situation.csv | grep "空港検疫" \
  | gawk -v FPAT='([^,]+)|(\"[^\"]+\")' '{print $2 "n" $3}' | tr -d '\\,+"()' | tr 'n' ',' > current.tmp

s1=`cat current.tmp | cut -d, -f 3-4`
date=`cat airport_quarantine2.csv | tr -d '"' | awk -F',' -f kkk.awk | grep $s1 | cut -d, -f 1`

s2=`cat current.tmp`

grep -q "$date,$s2" airport_pcr_test_daily.csv || echo $date,$s2>> airport_pcr_test_daily.csv
