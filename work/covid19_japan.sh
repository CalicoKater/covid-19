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

#10 群馬県
url="http://stopcovid19.pref.gunma.jp/csv/01kanja.csv"
curl -s -o 10_gunma.csv $url
url="https://www.pref.gunma.jp/contents/100168631.pdf"
curl -s -o 10_gunma.pdf $url

#11 埼玉県
url=`curl -s https://opendata.pref.saitama.lg.jp/data/dataset/covid19-jokyo | grep -e "jokyo.*\.csv" | tail -n 1 | cut -d\" -f 2`
curl -s $url | iconv -f SJIS > 11_saitama.csv

#12 千葉県
link=`curl -s https://www.pref.chiba.lg.jp/shippei/press/2019/ncov-index.html | xmllint --html --xpath '//*[@id="tmp_contents"]/ul[1]/li[1]/a' - | cut -d\" -f 2`
url="https://www.pref.chiba.lg.jp$link"
curl -s -o 12_chiba.pdf $url
#ruby pdf_to_csv.rb 12_chiba.pdf | sed -e 's/^\[//' -e 's/\]$//' > 12_chiba.csv

xlsx2csv -s 1 12_chiba.xlsx > 12_chiba.csv
xlsx2csv -s 2 12_chiba.xlsx > 12_chiba2.csv

#xlsx2csv -s 1 12_chiba_PdfToExcel.xlsx > 12_chiba.csv
#xlsx2csv -s 2 12_chiba_PdfToExcel.xlsx > 12_chiba2.csv

#xlsx2csv -s 1 12_chiba_PdfToExcel.xlsx | sed 's/^,//' > 12_chiba.csv
#xlsx2csv -s 2 12_chiba_PdfToExcel.xlsx >> 12_chiba.csv
#xlsx2csv -s 3 12_chiba_PdfToExcel.xlsx >> 12_chiba.csv
#xlsx2csv -s 4 12_chiba_PdfToExcel.xlsx >> 12_chiba.csv
#xlsx2csv -s 5 12_chiba_PdfToExcel.xlsx >> 12_chiba.csv
#xlsx2csv -s 6 12_chiba_PdfToExcel.xlsx >> 12_chiba.csv
#xlsx2csv -s 7 12_chiba_PdfToExcel.xlsx >> 12_chiba.csv



#xlsx2csv -s 8 12_chiba_PdfToExcel.xlsx | sed 's/^,//' > 12_chiba2.csv
#xlsx2csv -s 9 12_chiba_PdfToExcel.xlsx >> 12_chiba2.csv

#13 東京都
url="https://stopcovid19.metro.tokyo.lg.jp/data/130001_tokyo_covid19_patients.csv"
curl -s -o 13_tokyo.csv $url

#14 神奈川県
url="https://www.pref.kanagawa.jp/osirase/1369/data/csv/patient.csv"
curl -s $url | iconv -f SJIS > 14_kanagawa.csv

#15 新潟県
url="https://www.pref.niigata.lg.jp/site/shingata-corona/256362836.html"
ruby ccc2.rb $url > 15_niigata.csv

#16 富山県
url="http://opendata.pref.toyama.jp/files/covid19/20200403/toyama_patients.csv"
curl -s -o 16_toyama.csv $url
link=`curl -s http://www.pref.toyama.jp/cms_sec/1205/kj00021798.html \
 | xmllint --html --xpath '//*[@id="file"]/ul/li[1]/a' - | iconv -f SJIS | cut -d\" -f 2`
curl -s -o 16_toyama2.xlsx $link
xlsx2csv 16_toyama2.xlsx > 16_toyama2.csv

#17 石川県
url="https://www.pref.ishikawa.lg.jp/kansen/documents/170003_ishikawa_covid19_patients.csv"
curl -s $url | iconv -f SJIS > 17_ishikawa.csv


#18 福井県
url="https://www.pref.fukui.lg.jp/doc/toukei-jouhou/covid-19_d/fil/covid19_patients.csv"
curl -s -o 18_fukui.csv $url

# 19 山梨県
url="https://www.pref.yamanashi.jp/koucho/coronavirus/documents/yousei.xlsx"
curl -s -o 19_yamanashi.xlsx $url
xlsx2csv 19_yamanashi.xlsx > 19_yamanashi.csv

#20 長野県
url="https://www.pref.nagano.lg.jp/hoken-shippei/kenko/kenko/kansensho/joho/documents/200000_nagano_covid19_patients.csv"
curl -s $url | iconv -f SJIS  > 20_nagano.csv

#21 岐阜県
url="https://data.gifu-opendata.pref.gifu.lg.jp/dataset/4661bf9d-6f75-43fb-9d59-f02eb84bb6e3/resource/9c35ee55-a140-4cd8-a266-a74edf60aa80/download/210005gifucovid19patients.csv"
curl -s $url | iconv -f SJis > 21_gifu.csv

#40 福岡県
url="https://ckan.open-governmentdata.org/dataset/8a9688c2-7b9f-4347-ad6e-de3b339ef740/resource/c27769a2-8634-47aa-9714-7e21c4038dd4/download/400009_pref_fukuoka_covid19_patients.csv"
curl -s -o 40_fukuoka.csv $url
