url="https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000121431_00086.html"
curl -s $url | grep "（空港検疫）" | sed 's/<\/div>//g' | xmllint --html --xpath '//a/@href' - \
  | tr ' ' '\n' | grep  -v ^$ | tail -r | cut -d '"' -f 2
