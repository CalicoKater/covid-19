#!/bin/bash
curl -s -O https://dl.dropboxusercontent.com/s/6mztoeb6xf78g5w/COVID-19.csv

#01 北海道
url="https://www.harp.lg.jp/opendata/dataset/1369/resource/3132/010006_hokkaido_covid19_patients.csv"
curl -s $url | iconv -f SJIS > 01_hokkaido.csv
url="https://www.harp.lg.jp/opendata/dataset/1369/resource/2853/covid19_data.csv"
curl -s $url | iconv -f SJIS > 01_hokkaido2.csv
#02 青森県
link=`curl -s "https://opendata.pref.aomori.lg.jp/dataset/1531.html" \
  | xmllint --html --xpath '//*/div/div/div/div[2]/div/div[2]/div[2]/a/@href' - | cut -d\" -f 2`
url="https://opendata.pref.aomori.lg.jp$link"
curl -s $url | iconv -f SJIS > 02_aomori.csv
url="https://stopcovid19.pref.aomori.lg.jp/cards/attributes-of-confirmed-cases/"
curl -s $url | xmllint --html --xpath '///table/tbody/tr/td/a/@href' - \
  | tr ' ' '\n' | sed 's/href=//g' | tr -d '"' | tail -r | nl | awk '$1!=""{printf "%s,%s\n",$1, $2}' > 02_aomori2.csv
#03 岩手県
url="https://www.pref.iwate.jp/kurashikankyou/iryou/covid19/1029635/index.html"
ruby ccc2.rb $url > 03_iwate.csv
#04 宮城県
link=`curl -s "https://www.pref.miyagi.jp/site/covid-19/02.html" \
 | xmllint --html --xpath '//*[@id="main_body"]/div[3]/p[6]/a' - | cut -d\" -f 2`
url="https://www.pref.miyagi.jp$link"
curl -s -o 04_miyagi.xlsx $url
/usr/local/bin/xlsx2csv 04_miyagi.xlsx | cut -d, -f 1-8 > 04_miyagi.csv
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
/usr/local/bin/xlsx2csv 09_tochigi.xlsx | grep -v "4/30発生届取下げのため削除" > 09_tochigi.csv

#10 群馬県
url="http://stopcovid19.pref.gunma.jp/csv/01kanja.csv"
# #489 欠番
#curl -s $url | grep -v '^489,9月7日,月,伊勢崎市,60代,男性' > 10_gunma.csv
curl -s -o 10_gunma.csv $url

url="https://www.pref.gunma.jp/contents/100168631.pdf"
curl -s -o 10_gunma.pdf $url

#11 埼玉県
url=`curl -s https://opendata.pref.saitama.lg.jp/data/dataset/covid19-jokyo | grep -e "jokyo.*\.csv" | tail -n 1 | cut -d\" -f 2`
curl -s $url | iconv -f SJIS > 11_saitama.csv
link=`curl -s "https://www.pref.saitama.lg.jp/a0701/covid19/jokyo.html" | xmllint --html --xpath '//*[@id="tmp_contents"]/p[3]/a' - | cut -d\" -f 2`
curl -s -o 11_saitama.pdf "https://www.pref.saitama.lg.jp$link"
pdftotext -layout 11_saitama.pdf - | awk '{printf "%s,%s,%s,%s,%s,%s\n", $1, $2, $3, $4, $5, $6}' > 11_saitama2.csv

#12 千葉県
link=`curl -s https://www.pref.chiba.lg.jp/shippei/press/2019/ncov-index.html | xmllint --html --xpath '//*[@id="tmp_contents"]/ul[1]/li[1]/a' - | cut -d\" -f 2`
url="https://www.pref.chiba.lg.jp$link"
curl -s -o 12_chiba.pdf $url
#pdftotext -layout 12_chiba.pdf - 
#ruby pdf_to_csv.rb 12_chiba.pdf | sed -e 's/^\[//' -e 's/\]$//' > 12_chiba.csv

#xlsx2csv --all 12_chiba.xlsx | sed 's/^,//'

# ２シートに分かれた場合
#xlsx2csv -s 1 12_chiba.xlsx > 12_chiba.csv
#xlsx2csv -s 2 12_chiba.xlsx | sed -e 's/1,50代,女性,中国（武漢市）,ﾁｬｰﾀｰ便,9月28日/1,50代,女性,中国（武漢市）,ﾁｬｰﾀｰ便,1月30日/g' > 12_chiba2.csv

#url="https://www.pref.chiba.lg.jp/shippei/press/2019/documents/chiba_corona_data.xlsx"
#curl -s -o 12_chiba3.xlsx $url
#xlsx2csv chiba3.xlsx > 12_chiba3.csv

# ページごとに別れた場合
xlsx2csv -s 1 12_chiba.xlsx | sed 's/^,//' > 12_chiba.csv
xlsx2csv -s 2 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 3 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 4 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 5 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 6 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 7 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 8 12_chiba.xlsx | sed 's/^,//' | sed -e 's/1,50代,女性,中国（武漢市）,ﾁｬｰﾀｰ便,9月28日/1,50代,女性,中国（武漢市）,ﾁｬｰﾀｰ便,1月30日/g' > 12_chiba2.csv
xlsx2csv -s 9 12_chiba.xlsx >> 12_chiba2.csv

#xlsx2csv -s 10 12_chiba.xlsx >> 12_chiba2.csv

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
curl -s $url | iconv -f SJIS > 21_gifu.csv

#22 静岡県
url="https://opendata.pref.shizuoka.jp/dataset/8167/resource/46279/220001_shizuoka_covid19_patients.csv"
curl -s $url | iconv -f SJIS > 22_shizuoka.csv

# ★★★保留★★★
#url="https://opendata.pref.shizuoka.jp/dataset/8113/resource/47635/221309_hamamatsu_covid19_patients.csv"
#     https://opendata.pref.shizuoka.jp/dataset/8113/resource/47647/221309_hamamatsu_covid19_patients.csv
#curl -s $url | iconv -f SJIS > 22_shizuoka2.csv

#23 愛知県
link=`curl -s "https://www.pref.aichi.jp/site/covid19-aichi/" | xmllint --html --xpath '//*[@id="main_body"]/div[1]/p[4]/span[4]/a' - | cut -d\" -f 2`
url="https://www.pref.aichi.jp/$link"
curl -s -o 23_aichi.pdf $url

link=`curl -s "https://www.pref.aichi.jp/site/covid19-aichi/" | xmllint --html --xpath '//*[@id="main_body"]/div[1]/p[4]/a' - | cut -d\" -f 2`
url="https://www.pref.aichi.jp/$link"
curl -s -o 23_aichi2.pdf $url

#ruby pdf_to_csv.rb 23_aichi.pdf | sed -e 's/^\[//' -e 's/\]$//' > 23_aichi.csv
#ruby pdf_to_csv.rb 23_aichi2.pdf | sed -e 's/^\[//' -e 's/\]$//' >> 23_aichi.csv
xlsx2csv 23_aichi.xlsx > 23_aichi.csv
xlsx2csv 23_aichi2.xlsx > 23_aichi2.csv

#24 三重県
url="https://www.pref.mie.lg.jp/common/content/000896797.csv"
curl -s $url | iconv -f SJIS > 24_mie.csv
url="https://www.pref.mie.lg.jp/YAKUMUS/HP/m0068000066_00011.htm"
ruby ccc2.rb $url > 24_mie2.csv

#url="https://www.pref.mie.lg.jp/YAKUMUS/HP/m0068000066_00012.htm"
#ruby ccc2.rb $url >> 24_mie2.csv
#url="https://www.pref.mie.lg.jp/YAKUMUS/HP/m0068000066_00014.htm"
#ruby ccc2.rb $url >> 24_mie2.csv

#25 滋賀県
 ruby ccc.rb shiga_table.html | tail -r > 25_shiga.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="滋賀県"')  | awk -F, -f jag2.awk > 25_shiga2.csv  

#26 京都府
url="https://www.pref.kyoto.jp/kentai/corona/hassei1-50.html"
ruby ccc2.rb $url > 26_kyoto.csv

url="https://www.pref.kyoto.jp/kentai/corona/documents/jyoukyo001-580.pdf"
curl -s -o 26_kyoto.pdf $url
xlsx2csv 26_kyoto.xlsx -s 1 >> 26_kyoto.csv
xlsx2csv 26_kyoto.xlsx -s 2 >> 26_kyoto.csv

#27 大阪府
url="http://www.pref.osaka.lg.jp/attach/23711/00346644/youseisyajyouhou.xlsx"
curl -s -o 27_osaka.xlsx $url
xlsx2csv 27_osaka.xlsx > 27_osaka.csv

# 9/18
#url="http://www.pref.osaka.lg.jp/hodo/attach/hodo-39377_5.xlsx"
#curl -s -o 27_osaka2.xlsx $url
#xlsx2csv -s 2 27_osaka2.xlsx > 27_osaka2.csv
# 9/19
#url="http://www.pref.osaka.lg.jp/hodo/attach/hodo-39386_5.xlsx"
#curl -s -o 27_osaka3.xlsx $url
#xlsx2csv -s 2 27_osaka3.xlsx >> 27_osaka2.csv
# 9/20
#url="http://www.pref.osaka.lg.jp/hodo/attach/hodo-39388_5.xlsx"
#curl -s -o 27_osaka4.xlsx $url
#xlsx2csv -s 2 27_osaka4.xlsx >> 27_osaka2.csv
# 9/21
#url="http://www.pref.osaka.lg.jp/hodo/attach/hodo-39389_5.xlsx"
#curl -s -o 27_osaka5.xlsx $url
#xlsx2csv -s 2 27_osaka5.xlsx >> 27_osaka2.csv
# 9/22
#url="http://www.pref.osaka.lg.jp/hodo/attach/hodo-39390_5.xlsx"
#curl -s -o 27_osaka6.xlsx $url
#xlsx2csv -s 2 27_osaka6.xlsx >> 27_osaka2.csv
# 9/23
#url="http://www.pref.osaka.lg.jp/hodo/attach/hodo-39395_5.xlsx"
#curl -s -o 27_osaka7.xlsx $url
#xlsx2csv -s 2 27_osaka7.xlsx >> 27_osaka2.csv

#07/01-
#rm 27_osaka3.csv
#for url in `cut -f 2 osaka_link.txt`; do
#  curl -s -o 27_osaka.xlsx $url
#  xlsx2csv -s 2 27_osaka.xlsx | sed -e '/^$/d' >> 27_osaka3.csv 
#done

#28 兵庫県
#url="https://web.pref.hyogo.lg.jp/kk03/documents/corona-kanjajokyou.xlsx"
#url="https://web.pref.hyogo.lg.jp/kk03/documents/corona_kanjyajyokyo.xlsx"
#curl -s -o 28_hyogo.xlsx $url
#xlsx2csv 28_hyogo.xlsx | sed 's/^,//' > 28_hyogo.csv
link=`curl -s "https://web.pref.hyogo.lg.jp/kk03/corona_kanjyajyokyo.html" | xmllint --html --xpath '//*[@id="tmp_contents"]/div[2]/p[4]/a' - | cut -d\" -f 2`
url="https://web.pref.hyogo.lg.jp$link"
curl -s -o 28_hyogo.xlsx $url
xlsx2csv 28_hyogo.xlsx | sed 's/^,//' > 28_hyogo.csv

#29 奈良県
url="http://www.pref.nara.jp/secure/227193/%E5%A5%88%E8%89%AF%E7%9C%8C_01%E6%96%B0%E5%9E%8B%E3%82%B3%E3%83%AD%E3%83%8A%E3%82%A6%E3%82%A4%E3%83%AB%E3%82%B9%E6%84%9F%E6%9F%93%E8%80%85_%E6%82%A3%E8%80%85%E3%83%AA%E3%82%B9%E3%83%88.xlsx"
curl -s -o 29_nara.xlsx $url
xlsx2csv 29_nara.xlsx > 29_nara.csv
url="http://www.pref.nara.jp/secure/227221/%E5%A5%88%E8%89%AF%E7%9C%8C_02%E6%96%B0%E5%9E%8B%E3%82%B3%E3%83%AD%E3%83%8A%E3%82%A6%E3%82%A4%E3%83%AB%E3%82%B9%E6%84%9F%E6%9F%93%E8%80%85_%E6%82%A3%E8%80%85%E9%9B%86%E8%A8%88%E8%A1%A8.xlsx"
curl -s -o 29_nara2.xlsx $url
xlsx2csv 29_nara2.xlsx > 29_nara2.csv

#30 和歌山県
url="https://raw.githubusercontent.com/wakayama-pref-org/covid19/master/csv/kansensuii.csv"
curl -s -o 30_wakayama.csv $url

#31 鳥取県
url="https://www.pref.tottori.lg.jp/item/1207264.htm"
ruby ccc2.rb $url 2 > 31_tottori.csv

#32 島根県
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="島根県"')  | awk -F, -f jag2.awk > 32_shimane.csv

#33 岡山県
url="http://www.okayama-opendata.jp/ckan/dataset/e6b3c1d2-2f1f-4735-b36e-e45d36d94761/resource/c6503ebc-b2e9-414c-aae7-7374f4801e21/download/kansenshashousaijouhou0420.csv"
curl -s $url | iconv -f SJIS > 33_okayama.csv

#34 広島県
url="https://www.pref.hiroshima.lg.jp/site/hcdc/covid19-kanjya.html"
ruby ccc2.rb $url > 34_hiroshima.csv
awk -F, ''
#35 山口県
url="https://yamaguchi-opendata.jp/ckan/dataset/f6e5cff9-ae43-4cd9-a398-085187277edf/resource/f56e6552-4c5d-4ec6-91c0-090f553e0aea/download/350001_yamaguchi_covid19_patients.csv"
curl -s -o 35_yamaguchi.csv $url

#36 徳島県
url="https://www.pref.tokushima.lg.jp/ippannokata/kenko/kansensho/5034012"
ruby ccc2.rb $url 2 > 36_tokushima.csv
ruby ccc2.rb $url 3 >> 36_tokushima.csv

#37 香川県
url="https://www.pref.kagawa.lg.jp/content/etc/subsite/kansenshoujouhou/kansen/se9si9200517102553.shtml"
ruby ccc2.rb $url 3 > 37_kagawa.csv
url="https://opendata.pref.kagawa.lg.jp/dataset/359/resource/4390/%E6%A4%9C%E6%9F%BB%E4%BB%B6%E6%95%B0.csv"
curl -s $url | iconv -f SJIS > 37_kagawa2.csv

#38 愛媛県
url="https://www.pref.ehime.jp/opendata-catalog/dataset/2174/resource/7057/380008_ehime_covid19_patients.csv"
curl -s -o 38_ehime.csv $url

#39 高知県
url="https://www.pref.kochi.lg.jp/soshiki/111301/files/2020041300141/390003_kochi_covid19_patients.csv"
curl -s $url | iconv -f SJIS > 39_kochi.csv

#40 福岡県
url="https://ckan.open-governmentdata.org/dataset/8a9688c2-7b9f-4347-ad6e-de3b339ef740/resource/c27769a2-8634-47aa-9714-7e21c4038dd4/download/400009_pref_fukuoka_covid19_patients.csv"
curl -s -o 40_fukuoka.csv $url

#41 佐賀県
url="https://www.pref.saga.lg.jp/kiji00373220/index.html"
ruby ccc2.rb $url 3 > 41_saga.csv

#42 長崎県
url="https://data.bodik.jp/dataset/09951e04-dc5d-42e9-9a49-37443be6787e/resource/de7ce61e-1849-47a1-b758-bca3f809cdf8/download/20200916prefnagasakicovidpatients.csv"
curl -s -o 42_nagasaki.csv $url

#43 熊本県
link=`curl -s "https://www.pref.kumamoto.jp/kiji_22038.html" \
 | sed -e 's/<ul>//g' -e 's/<\/ul>//g' \
 | xmllint --html --xpath '//*[@id="danraku1"]/div[11]/div[1]/div/table/tbody/tr[3]/td[4]/li/a' - \
 | cut -d\" -f 2 | sed -e 's/&amp;/\&/g'`
curl -s -o 43_kumamoto.csv $link

#44 大分県
url="https://data.bodik.jp/dataset/f632f467-716c-46aa-8838-0d535f98b291/resource/3714d264-70f3-4518-a57a-8391e0851d7d/download/440001oitacovid19patients.csv"
curl -s -o 44_oita.csv $url

#45 宮崎県
url="https://www.pref.miyazaki.lg.jp/kansensho-taisaku/covid-19/hassei_list.html"
ruby ccc2.rb $url > 45_miyazaki.csv

#46 鹿児島県
url="https://www.pref.kagoshima.jp/ae06/kenko-fukushi/kenko-iryo/kansen/kansensho/coronavirus.html"
ruby ccc2.rb $url 4 >46_kagoshima.csv

#47 沖縄県
url="https://www.pref.okinawa.lg.jp/site/hoken/chiikihoken/kekkaku/press/documents/youseisyaitiran.csv"
curl -s $url | iconv -f SJIS > 47_okinawa.csv
