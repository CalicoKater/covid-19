#!/bin/bash

#01 北海道
url="https://www.harp.lg.jp/opendata/dataset/1369/resource/3132/010006_hokkaido_covid19_patients.csv"
curl -s $url | iconv -f SJIS > 01_hokkaido.csv
url="https://www.harp.lg.jp/opendata/dataset/1369/resource/2853/covid19_data.csv"
curl -s $url | iconv -f SJIS > 01_hokkaido2.csv

#02 青森県
url="https://opendata.pref.aomori.lg.jp/dataset/1531/resource/11827/02_20200827_%E9%99%BD%E6%80%A7%E6%82%A3%E8%80%85%E9%96%A2%E4%BF%82.csv"
curl -s $url | iconv -f SJIS > 02_aomori.csv

#03 岩手県
url="https://www.pref.iwate.jp/kurashikankyou/iryou/covid19/1029635/index.html"
ruby ccc2.rb $url > 03_iwate.csv

#04 宮城県
link=`curl -s "https://www.pref.miyagi.jp/site/covid-19/02.html" \
 | xmllint --html --xpath '//*[@id="main_body"]/div[3]/p[6]/a' - | cut -d\" -f 2`
url="https://www.pref.miyagi.jp$link"
curl -s -o 04_miyagi.xlsx $url
/usr/local/bin/xlsx2csv 04_miyagi.xlsx > 04_miyagi.csv

#05 秋田県
url="https://www.pref.akita.lg.jp/pages/archive/47957"
ruby ccc2.rb $url > 05_akita.csv

#06 山形県
link=`curl -s https://www.pref.yamagata.jp/ou/kenkofukushi/090001/20130425/shingata_corona.html \
 | xmllint --html --xpath '//*[@id="parent-fieldname-text"]/table[5]/tbody/tr[1]/td[1]/p/a' - | cut -d\" -f 2`
url="https://www.pref.yamagata.jp$link"
curl -s $url | iconv -f SJIS > 06_yamagata.csv

#07 福島県
url="https://www.pref.fukushima.lg.jp/sec/21045c/fukushima-hasseijyoukyou.html"
ruby ccc2.rb $url > 07_fukushima.csv

link=`ruby ccc2.rb http://www.pref.fukushima.lg.jp/w4/covid19/patients/ | grep "070009_fukushima_covid19_patients" | tail -n 1 | cut -d, -f 2`
url="http://www.pref.fukushima.lg.jp/w4/covid19/patients/$link"
curl -s $url | iconv -f SJIS > 07_fukushima2.csv

#08 茨城県
url="https://www.pref.ibaraki.jp/1saigai/2019-ncov/ichiran.html"
ruby ccc2.rb $url > 08_ibaraki.csv

#09 栃木県
link=`curl -s http://www.pref.tochigi.lg.jp/e04/welfare/hoken-eisei/kansen/hp/coronakensahasseijyoukyou.html \
 | xmllint --html --xpath '//*[@id="tmp_contents"]/ul[1]/li[2]/a' - | cut -d\" -f 2`
url="http://www.pref.tochigi.lg.jp$link"
curl -s -o 09_tochigi.xlsx $url
/usr/local/bin/xlsx2csv 09_tochigi.xlsx > 09_tochigi.csv
