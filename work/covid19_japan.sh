#!/bin/bash
curl -s -O https://dl.dropboxusercontent.com/s/6mztoeb6xf78g5w/COVID-19.csv
<< jag_skip
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="北海道"') | awk -F, -f jag2.awk > 01_jag_hokkaido.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="青森県"') | awk -F, -f jag2.awk > 02_jag_aomori.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="岩手県"') | awk -F, -f jag2.awk > 03_jag_iwate.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="宮城県"') | awk -F, -f jag2.awk > 04_jag_miyagi.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="秋田県"') | awk -F, -f jag2.awk > 05_jag_akita.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="山形県"') | awk -F, -f jag2.awk > 06_jag_yamagata.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="福島県"') | awk -F, -f jag2.awk > 07_jag_fukushima.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="茨城県"') | awk -F, -f jag2.awk > 08_jag_ibaraki.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="栃木県"') | awk -F, -f jag2.awk > 09_jag_tochigi.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="群馬県"') | awk -F, -f jag2.awk > 10_jag_gunma.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="埼玉県"') | awk -F, -f jag2.awk > 11_jag_saitama.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="千葉県"') | awk -F, -f jag2.awk > 12_jag_chiba.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="東京都"') | awk -F, -f jag2.awk > 13_jag_tokyo.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="神奈川県"') | awk -F, -f jag2.awk > 14_jag_kanagawa.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="新潟県"') | awk -F, -f jag2.awk > 15_jag_niigata.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="富山県"') | awk -F, -f jag2.awk > 16_jag_toyama.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="石川県"') | awk -F, -f jag2.awk > 17_jag_ishikawa.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="福井県"') | awk -F, -f jag2.awk > 18_jag_fukui.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="山梨県"') | awk -F, -f jag2.awk > 19_jag_yamanashi.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="長野県"') | awk -F, -f jag2.awk > 20_jag_nagano.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="岐阜県"') | awk -F, -f jag2.awk > 21_jag_gifu.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="静岡県"') | awk -F, -f jag2.awk > 22_jag_shizuoka.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="愛知県"') | awk -F, -f jag2.awk > 23_jag_aichi.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="三重県"') | awk -F, -f jag2.awk > 24_jag_mie.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="滋賀県"') | awk -F, -f jag2.awk > 25_jag_shiga.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="京都府"') | awk -F, -f jag2.awk > 26_jag_kyoto.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="大阪府"') | awk -F, -f jag2.awk > 27_jag_osaka.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="兵庫県"') | awk -F, -f jag2.awk > 28_jag_hyogo.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="奈良県"') | awk -F, -f jag2.awk > 29_jag_nara.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="和歌山県"') | awk -F, -f jag2.awk > 30_jag_wakayama.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="鳥取県"') | awk -F, -f jag2.awk > 31_jag_tottori.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="島根県"') | awk -F, -f jag2.awk > 32_jag_shimane.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="岡山県"') | awk -F, -f jag2.awk > 33_jag_okayama.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="広島県"') | awk -F, -f jag2.awk > 34_jag_hiroshima.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="山口県"') | awk -F, -f jag2.awk > 35_jag_yamaguchi.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="徳島県"') | awk -F, -f jag2.awk > 36_jag_tokushima.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="香川県"') | awk -F, -f jag2.awk > 37_jag_kagawa.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="愛媛県"') | awk -F, -f jag2.awk > 38_jag_ehime.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="高知県"') | awk -F, -f jag2.awk > 39_jag_kochi.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="福岡県"') | awk -F, -f jag2.awk > 40_jag_fukuoka.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="佐賀県"') | awk -F, -f jag2.awk > 41_jag_saga.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="長崎県"') | awk -F, -f jag2.awk > 42_jag_nagasaki.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="熊本県"') | awk -F, -f jag2.awk > 43_jag_kumamoto.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="大分県"') | awk -F, -f jag2.awk > 44_jag_oita.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="宮崎県"') | awk -F, -f jag2.awk > 45_jag_miyazaki.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="鹿児島県"') | awk -F, -f jag2.awk > 46_jag_kagoshima.csv
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="沖縄県"') | awk -F, -f jag2.awk > 47_jag_okinawa.csv
jag_skip

#01 北海道
url="https://www.harp.lg.jp/opendata/dataset/1369/resource/3132/010006_hokkaido_covid19_patients.csv"
curl -s $url | iconv -f SJIS > 01_hokkaido.csv
cat 01_hokkaido.csv | awk -F, -f 01_hokkaido.awk > 01_hokkaido2.csv

url="https://www.harp.lg.jp/opendata/dataset/1369/resource/2853/covid19_data.csv"
curl -s $url | iconv -f SJIS > 01_hokkaido4.csv

url="http://www.pref.hokkaido.lg.jp/hf/kth/kak/hasseijoukyou.htm"
link=`curl -s $url | xmllint --html --xpath '//*[@id="rs_contents"]/span/ul[2]/li/a/@href' - | cut -d\" -f 2`
url="http://www.pref.hokkaido.lg.jp$link"
curl -sL $url -o 01_hokkaido.pdf
pdftotext  -layout  01_hokkaido.pdf - \
 | awk '$1!=""&&$1+0>0{printf "%s,%s,%s,%s,%s,\"%s\"\n",$1,$2,$3,$4,$5,$6}' \
 | sed -e 's/451,,,,,\"\"//g' > 01_hokkaido3.csv
  #| sed -e 's/381,4/18,60代,男,宗谷総合振興局管内,\"\"/381,4/18,60代,男,宗谷総合振興局管内,\"No.321～323,362～369,380,382,398～407,No.448～451\"/g'
  #| sed -e 's/380,4/18,80代,男,石狩振興局管内,\"\"/'

#011002 札幌市
output="01_sapporo_city_case_number.csv"
echo "No,北海道発表No,判明日" > $output
url="https://www.city.sapporo.jp/hokenjo/f1kansen/2019n-covhassei_1.html"
ruby ccc2.rb $url | cut -d, -f 1-3 | awk -F, -f 01_sapporo.awk >> $output
url="https://www.city.sapporo.jp/hokenjo/f1kansen/2019n-covhassei.html"
ruby ccc2.rb $url 4 | cut -d, -f 1-3 | awk -F, -f 01_sapporo.awk >> $output

# 函館市 
url="https://www.city.hakodate.hokkaido.jp/docs/2020050300019/"
ruby ccc2.rb $url 0 | awk -F, -f 01_hakodate.awk  > 01_hakodate_city.csv

# 旭川市
url="https://www.city.asahikawa.hokkaido.jp/kurashi/135/136/150/d068529.html"
ruby ccc2.rb $url 0 | awk -F, -f 01_hakodate.awk > 01_asahikawa_city.csv

# 小樽市 
url="https://www.city.otaru.lg.jp/2019-nCoV/COVID-19/"
ruby ccc2.rb $url | gawk -v FPAT='([^,]+)|(\"[^\"]+\")' -f 01_otaru.awk > 01_otaru_city.csv

echo "city_case_number,perf_case_number,report_date,age_class,gender,regidence,remarks_2,remarks_3" > 01_otaru_city2.csv
#pdftotext -raw 01_hokkaido.pdf - | awk 'BEGIN{OFS=","}{print $1,$2,$3,$4,$5,$6,$7}' | grep "小樽市公表中" | sort -t, -k 1n | nl -s, >>01_otaru_city2.csv
pdftotext -layout 01_hokkaido.pdf - | awk 'BEGIN{OFS=","}{print $1,$2,$3,$4,$5,$6,$7}' | grep "小樽市公表中" | sort -t, -k 1n | nl -s, >>01_otaru_city2.csv


#02 青森県
#'//*[@id="cms-tab-7-0-view"]/div/div/div/div[3]/div/div[2]/div[2]/a'
#'//*/div/div/div/div[2]/div/div[2]/div[2]/a/@href'
link=`curl -s "https://opendata.pref.aomori.lg.jp/dataset/1531.html" \
  | xmllint --html --xpath '//*/div/div/div/div[3]/div/div[2]/div[2]/a/@href' - | cut -d\" -f 2`
url="https://opendata.pref.aomori.lg.jp$link"
curl -s $url | iconv -f SJIS > 02_aomori.csv
# 年月日の書式変更
cat 02_aomori.csv | awk -F, -f 02_aomori.awk > 02_aomori2.csv
#url="https://stopcovid19.pref.aomori.lg.jp/cards/attributes-of-confirmed-cases/"
#curl -s $url | xmllint --html --xpath '///table/tbody/tr/td/a/@href' - \
#  | tr ' ' '\n' | sed 's/href=//g' | tr -d '"' | tail -r | nl | awk '$1!=""{printf "%s,%s\n",$1, $2}' > 02_aomori2.csv
#八戸市保健所管内症例番号
#echo city_case_number, perf_case_number > 02_hachinohe_case_number.csv
#cat 02_aomori.csv | cut -d, -f 1,4 | grep "八戸市保健所管内" | sort -t, -k 1n | nl -s, | awk -F, '{printf "%d,%d\n",$1,$2}' >> 02_hachinohe_case_number.csv

#03 岩手県
url="https://www.pref.iwate.jp/kurashikankyou/iryou/covid19/1029635/index.html"
ruby ccc2.rb $url > 03_iwate.csv
cat 03_iwate.csv| awk -F, -f 03_iwate.awk > 03_iwate2.csv

#04 宮城県
link=`curl -s "https://www.pref.miyagi.jp/site/covid-19/02.html" \
 | xmllint --html --xpath '//*[@id="main_body"]/div[3]/p[8]/a' - | cut -d\" -f 2`
url="https://www.pref.miyagi.jp$link"
curl -s -o 04_miyagi.xlsx $url
#/usr/local/bin/xlsx2csv 04_miyagi.xlsx | cut -d, -f 1-8 > 04_miyagi.csv
#xlsx2csv -s 2 04_miyagi.xlsx | cut -d, -f 1-8 > 04_miyagi.csv
xlsx2csv -s 1 04_miyagi.xlsx | cut -d, -f 1-8 > 04_miyagi.csv
cat 04_miyagi.csv | awk -F, -f 04_miyagi.awk > 04_miyagi2.csv

#041009 仙台市
output="04_sendai_city_case_number.csv"
echo "city_case_number,perf_case_number" > $output
url="https://www.city.sendai.jp/kikikanri/kinkyu/corona2020/hassei/kanja1-65.html"
#ruby ccc2.rb $url | awk -F, '$1+0>0{printf "%d,%d\n",$1, $7}' >> $output
ruby ccc2.rb $url | awk -F, '$1+0>0{printf "%d,%d\n",$1, $6}' >> $output
url="https://www.city.sendai.jp/kikikanri/kinkyu/200131corona2.html"
#ruby ccc2.rb $url 1 | awk -F, '$1+0>0{printf "%d,%d\n",$1, $7}' >> $output
ruby ccc2.rb $url 1 | awk -F, '$1+0>0{printf "%d,%d\n",$1, $6}' >> $output

#05 秋田県
url="https://www.pref.akita.lg.jp/pages/archive/47957"
ruby ccc2.rb $url > 05_akita.csv
# No.1-50
url="https://www.pref.akita.lg.jp/pages/archive/53190"
ruby ccc2.rb $url | grep -v "県内症例" >> 05_akita.csv
cat  05_akita.csv | awk -F, -f 05_akita.awk > 05_akita2.csv

#06 山形県

#link=`curl -s https://www.pref.yamagata.jp/ou/kenkofukushi/090001/20130425/shingata_corona.html \
#link=`curl -s https://www.pref.yamagata.jp/090001/bosai/kochibou/kikikanri/covid19/shingata_corona.html \
# | xmllint --html --xpath '//*[@id="parent-fieldname-text"]/table[5]/tbody/tr[1]/td[1]/p/a' - | cut -d\" -f 2`
link=`curl -s https://www.pref.yamagata.jp/090001/bosai/kochibou/kikikanri/covid19/shingata_corona.html \
 | xmllint --html --xpath '//*[contains(./text(),"陽性患者属性（CSV：")]/@href' - | cut -d\" -f 2`
url="https://www.pref.yamagata.jp$link"
curl -s $url | iconv -f SJIS > 06_yamagata.csv
cat 06_yamagata.csv | awk -F, -f 06_yamagata.awk > 06_yamagata2.csv

#url="https://www.pref.yamagata.jp/kenfuku/kenko/kansen/720130425shingata_corona.html"
url="https://www.pref.yamagata.jp/090001/bosai/kochibou/kikikanri/covid19/shingata_corona.html"
ruby ccc2.rb $url 5 > 06_yamagata3.csv
output=06_yamagata_city_case_number.csv
echo "perf_case_number,city_case_number" > $output
cat 06_yamagata3.csv | grep -e '山形市.*公表' | cut -d, -f 2,6 | sed -e 's/公表.*//g' | sed y/０１２３４５６７８９/0123456789/ | sed -e 's/[^0-9|,]//g' >> $output

#07 福島県
url="https://www.pref.fukushima.lg.jp/sec/21045c/fukushima-hasseijyoukyou.html"
ruby ccc2.rb $url > 07_fukushima.csv
#cat 07_fukushima.csv | awk -F, -f 07_fukushima.awk  > 07_fukushima3.csv
cat 07_fukushima.csv | gawk -v FPAT='([^,]+)|(\"[^\"]+\")' -f 07_fukushima.awk  > 07_fukushima3.csv

# *** csv の公表_年月日は公表日ではない事が多々ある***
link=`ruby ccc2.rb http://www.pref.fukushima.lg.jp/w4/covid19/patients/ | grep "070009_fukushima_covid19_patients" | tail -n 1 | cut -d, -f 2`
url="http://www.pref.fukushima.lg.jp/w4/covid19/patients/$link"
curl -s $url | iconv -f SJIS > 07_fukushima2.csv
cat 07_fukushima2.csv| awk -F, -f 07_fukushima2.awk > 07_fukushima4.csv

# 福島市 
url="https://www.city.fukushima.fukushima.jp/hoken-kansen-taisaku/kenko/iryo/kansensho/bukansinngatacorona_patient.html"
#echo "市症例,県症例,確認日,年代,性別,濃厚接触者の人数,濃厚接触者の健康観察,感染経路（推定）,備考" > 07_fukushima_city.csv
echo "市症例,県症例,確認日,年代,性別,感染経路（推定）,備考" > 07_fukushima_city.csv
ruby ccc2.rb $url | awk -F, '$2+0>0' >> 07_fukushima_city.csv

# 郡山市
url="https://www.city.koriyama.lg.jp/covid19/23685.html"
echo "市発生番号,県発生番号,判明日,年代,性別,備考" > 07_koriyama_city.csv
ruby ccc2.rb $url | awk -F, '$2+0>0' >> 07_koriyama_city.csv

# いわき市
url="http://www.city.iwaki.lg.jp/www/contents/1596713999605/index.html"
echo "市事例,県事例,年代,性別,陽性判明日,居住地,備考" > 07_iwaki_city.csv
ruby ccc2.rb $url 0 | awk -F, '$2+0>0' >> 07_iwaki_city.csv

#08 茨城県
url="https://www.pref.ibaraki.jp/1saigai/2019-ncov/ichiran.html"
ruby ccc2.rb $url > 08_ibaraki.csv

#cat 08_ibaraki.csv | awk -F, -f 08_ibaraki.awk > 08_ibaraki2.csv
(
  echo -n "No,"; head -n 1 08_ibaraki.csv 
  tail -r 08_ibaraki.csv | sed -e '$d' | nl -s, 
) | awk -F, -f 08_ibaraki.awk > 08_ibaraki2.csv

url="https://www.city.mito.lg.jp/001245/hokenjo/kansensyou/p022377.html"
ruby ccc2.rb $url > 08_mito_city.csv

#09 栃木県
link=`curl -s http://www.pref.tochigi.lg.jp/e04/welfare/hoken-eisei/kansen/hp/coronakensahasseijyoukyou.html \
 | xmllint --html --xpath '//*[@id="tmp_contents"]/ul[1]/li[2]/a' - | cut -d\" -f 2`
url="http://www.pref.tochigi.lg.jp$link"
curl -s -o 09_tochigi.xlsx $url
# ５８行目の#55 発生届取下げ 、#401 発生届取下げ
xlsx2csv 09_tochigi.xlsx | grep -v "4/30発生届取下げのため削除" | grep -v "9/25発生届取下げのため削除" > 09_tochigi.csv

cat 09_tochigi.csv | sed -e ':a' -e 'N' -e '$!ba' -e 's/症例\n/症例/g' | gawk -v FPAT='([^,]+)|(\"[^\"]+\")' -f 09_tochigi.awk > 09_tochigi2.csv
#092011 宇都宮市
url="https://www.city.utsunomiya.tochigi.jp/kurashi/kenko/kansensho/etc/1023506.html"
link=`curl -s $url | xmllint --html --xpath '//*[@id="voice"]/ul[1]/li[1]/a/@href' - | cut -d\" -f 2`
url="https://www.city.utsunomiya.tochigi.jp/kurashi/kenko/kansensho/etc/$link"
curl -s -o 09_utsunomiya_city.xlsx $url
xlsx2csv 09_utsunomiya_city.xlsx > 09_utsunomiya_city.csv
cat 09_utsunomiya_city.csv | awk 'NR>1' | cut -d, -f 1-2 | grep -v "5月22日再燃" | tr -d '県内例目' | \
  sed y/０１２３４５６７８９/0123456789/ | sed -e 's/市No./市No/g' > 09_utsunomiya_city_case_number.csv

#10 群馬県
url="http://stopcovid19.pref.gunma.jp/csv/01kanja.csv"
# #489 欠番 
curl -s -o 10_gunma.csv $url
cat 10_gunma.csv | awk -F, -f 10_gunma.awk > 10_gunma2.csv

url="https://www.pref.gunma.jp/07/z87g_00016.html"
link=`curl -s $url | xmllint --html --xpath "//*[contains(./text(),'県内における発生状況（3月）')]/@href" - | cut -d\" -f 2`
curl -s -o 10_gunma_202003.pdf "https://www.pref.gunma.jp$link"
link=`curl -s $url | xmllint --html --xpath "//*[contains(./text(),'県内における発生状況（4月）')]/@href" - | cut -d\" -f 2`
curl -s -o 10_gunma_202004.pdf "https://www.pref.gunma.jp$link"
link=`curl -s $url | xmllint --html --xpath "//*[contains(./text(),'県内における発生状況（5月）')]/@href" - | cut -d\" -f 2`
curl -s -o 10_gunma_202005.pdf "https://www.pref.gunma.jp$link"
link=`curl -s $url | xmllint --html --xpath "//*[contains(./text(),'県内における発生状況（6月）')]/@href" - | cut -d\" -f 2`
curl -s -o 10_gunma_202006.pdf "https://www.pref.gunma.jp$link"
link=`curl -s $url | xmllint --html --xpath "//*[contains(./text(),'県内における発生状況（7月）')]/@href" - | cut -d\" -f 2`
curl -s -o 10_gunma_202007.pdf "https://www.pref.gunma.jp$link"
link=`curl -s $url | xmllint --html --xpath "//*[contains(./text(),'県内における発生状況（8月）')]/@href" - | cut -d\" -f 2`
curl -s -o 10_gunma_202008.pdf "https://www.pref.gunma.jp$link"
link=`curl -s $url | xmllint --html --xpath "//*[contains(./text(),'県内における発生状況一覧')]/@href" - | cut -d\" -f 2`
curl -s -o 10_gunma_202009.pdf "https://www.pref.gunma.jp$link"

( echo "No,診断日,年代,居住地,性別,職業,備考"
  pdftotext -layout -raw 10_gunma_202003.pdf - | grep '^[0-9]' | grep -v -e "県外にて判明した陽性例" -e "空港検疫" | awk -f 10_gunma2.awk | sort -k 1n
  pdftotext -layout -raw 10_gunma_202004.pdf - | grep '^[0-9]' | grep -v -e "県外にて判明した陽性例" -e "空港検疫" | awk -f 10_gunma2.awk | sort -k 1n
  pdftotext -layout -raw 10_gunma_202005.pdf - | grep '^[0-9]' | grep -v -e "県外にて判明した陽性例" -e "空港検疫" | awk -f 10_gunma2.awk | sort -k 1n
  pdftotext -layout -raw 10_gunma_202006.pdf - | grep '^[0-9]' | grep -v -e "県外にて判明した陽性例" -e "空港検疫" | awk -f 10_gunma2.awk | sort -k 1n
  pdftotext -layout -raw 10_gunma_202007.pdf - | grep '^[0-9]' | grep -v -e "県外にて判明した陽性例" -e "空港検疫" | awk -f 10_gunma2.awk | sort -k 1n
  pdftotext -layout -raw 10_gunma_202008.pdf - | grep '^[0-9]' | grep -v -e "県外にて判明した陽性例" -e "空港検疫" | awk -f 10_gunma2.awk | sort -k 1n
  pdftotext -f 2 -raw -layout 10_gunma_202009.pdf - | grep -v -e "県外にて判明した陽性例" -e "空港検疫" | awk '{print $2,$3,$4,$5,$6,$7,$8}' | grep '^[0-9]' | awk -f 10_gunma2.awk | sort -k 1n
) > 10_gunma3.csv

#11 埼玉県
url=`curl -s https://opendata.pref.saitama.lg.jp/data/dataset/covid19-jokyo | grep -e "jokyo.*\.csv" | tail -n 1 | cut -d\" -f 2`
curl -s $url | iconv -f SJIS > 11_saitama.csv
cat 11_saitama.csv | awk -F, -f 11_saitama.awk > 11_saitama3.csv

link=`curl -s "https://www.pref.saitama.lg.jp/a0701/covid19/jokyo.html" | xmllint --html --xpath '//*[@id="tmp_contents"]//p/a[contains( ./text(),"陽性確認者一覧（PDF")]/@href' - | cut -d\" -f 2`
curl -s -o 11_saitama.pdf "https://www.pref.saitama.lg.jp$link"
#******************↓*** 条件を変えて取下げ重複を削除してはいけない ************************************
pdftotext -layout 11_saitama.pdf - | awk '$1>=5&&$1<=8{printf "%s,%s %s,%s,%s,%s\n",$1,$2,$3,$4,$5,$6}$1<5||$1>8{printf "%s,%s,%s,%s,%s,%s\n", $1, $2, $3, $4, $5, $6}' > 11_saitama2.csv

#111007 さいたま市
#url="https://www.city.saitama.jp/002/001/008/006/013/001/p075326.html"
#xpath='//*[@id="b2111_detail"]/div[1]/div/div/div/div/div/div/div/div/div/div/div/div[2]/strong[2]/a'
#link=`curl -s $url | xmllint --html --xpath $xpath - | cut -d\" -f 2`
#curl -s -o 11_saitama_city.pdf "https://www.city.saitama.jp$link"

url="https://www.city.saitama.jp/002/001/008/006/013/001/p075326_d/fil/yousei1-379.pdf"
curl -s -o 11_saitama_city_1_379.pdf $url
# pdf to excel (i love pdf: https://www.ilovepdf.com/ja/pdf_to_excel)
xlsx2csv -s 1 11_saitama_city_1_379.xlsx > 11_saitama_city_1_379.csv
xlsx2csv -s 2 11_saitama_city_1_379.xlsx >> 11_saitama_city_1_379.csv

ruby ccc2.rb "https://www.city.saitama.jp/002/001/008/006/013/001/p075326.html" > 11_saitama_city_380_.csv


#12 千葉県
link=`curl -s https://www.pref.chiba.lg.jp/shippei/press/2019/ncov-index.html | xmllint --html --xpath '//*[@id="tmp_contents"]/ul[1]/li[1]/a' - | cut -d\" -f 2`
url="https://www.pref.chiba.lg.jp$link"
curl -s -o 12_chiba.pdf $url
#open https://www.ilovepdf.com/ja/pdf_to_excel
#sleep 5
#open .
#pdftotext -layout 12_chiba.pdf - 
#ruby pdf_to_csv.rb 12_chiba.pdf | sed -e 's/^\[//' -e 's/\]$//' > 12_chiba.csv

#xlsx2csv --all 12_chiba.xlsx | sed 's/^,//'

# ２シートに分かれた場合
xlsx2csv -s 1 12_chiba.xlsx > 12_chiba.csv
xlsx2csv -s 2 12_chiba.xlsx > 12_chiba2.csv


# ページごとに別れた場合
<< chiba
xlsx2csv -s 1 12_chiba.xlsx | sed 's/^,//g' > 12_chiba.csv
xlsx2csv -s 2 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 3 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 4 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 5 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 6 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 7 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 8 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 9 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 10 12_chiba.xlsx >> 12_chiba.csv
xlsx2csv -s 11 12_chiba.xlsx | sed 's/^,//g' > 12_chiba2.csv
xlsx2csv -s 12 12_chiba.xlsx >> 12_chiba2.csv
chiba

ruby chiba2_csv.rb > 12_chiba4.csv
ruby chiba_csv.rb > 12_chiba3.csv

#13 東京都
url="https://stopcovid19.metro.tokyo.lg.jp/data/130001_tokyo_covid19_patients.csv"
curl -s -o 13_tokyo.csv $url

#14 神奈川県
url="https://www.pref.kanagawa.jp/osirase/1369/data/csv/patient.csv"
curl -s $url | iconv -f SJIS > 14_kanagawa.csv
#141003 横浜市
url="https://www.city.yokohama.lg.jp/city-info/koho-kocho/koho/topics/corona-data.files/141003_yokohama_covid19_patients.csv"
curl -s $url -o 14_yokohama_city.csv
url="https://www.city.yokohama.lg.jp/kurashi/kenko-iryo/yobosesshu/kansensho/coronavirus/kanja.html"
ruby ccc2.rb $url \
  | awk -F, 'BEGIN{OFS=","}NR==1{gsub(/No./,"横浜市症例番号",$1);print $0}$1+0>0{gsub(/（外部サイト）/,"",$2);print $0}' \
  > 14_yokohama_city2.csv

#川崎市 → PDF to Excel 

#横須賀市(current)
url="https://www.city.yokosuka.kanagawa.jp/3130/hasseijoukyou.html"
ruby ccc2.rb $url 1 > 14_yokosuka_city.csv
#横須賀市(archive)
#url="https://web.archive.org/web/20200515003320/https://www.city.yokosuka.kanagawa.jp/3130/hasseijoukyou.html"
#ruby ccc2.rb $url 1 > 14_yokosuka_city2.csv
#url="https://web.archive.org/web/20200718004041/https://www.city.yokosuka.kanagawa.jp/3130/hasseijoukyou.html"
#ruby ccc2.rb $url 1 >> 14_yokosuka_city2.csv
#url="https://web.archive.org/web/20200913003606/https://www.city.yokosuka.kanagawa.jp/3130/hasseijoukyou.html"
#ruby ccc2.rb $url 1 >> 14_yokosuka_city2.csv
#url="https://web.archive.org/web/20201005010249/https://www.city.yokosuka.kanagawa.jp/3130/hasseijoukyou.html"
#ruby ccc2.rb $url 1 >> 14_yokosuka_city2.csv

#cut -d, -f 1-5,7 14_yokosuka_city.csv 14_yokosuka_city2.csv | tr -d ' ' | sort -k 1n | uniq > 14_yokosuka_city3.csv
# cut -d, -f 1-5,7 14_yokosuka_city.csv 14_yokosuka_city2.csv | tr -d ' ' | sort -k 1n | uniq | awk -F, -f 14_yokosuka_city.awk > 14_yokosuka_city3.csv
# 鎌倉保健福祉事務所管内
url="https://www.town.hayama.lg.jp/soshiki/choumin/shingatacorona/10248.html"
# No.134 : 県内3090 → 3190の間違い
# No.135 : 県内3091 → 3191の間違い
ruby ccc2.rb $url > 14_kamakura.csv
#ruby ccc2.rb $url 0 > 14_kamakura.csv
#ruby ccc2.rb $url 1 > 14_kamakura2.csv
cat 14_kamakura.csv | awk -F, -f 14_kamakura.awk > 14_kamakura2.csv

#15 新潟県
# No.1〜No.181まで？
url="https://www.pref.niigata.lg.jp/site/shingata-corona/256362836.html"
ruby ccc2.rb $url > 15_niigata.csv
cat 15_niigata.csv | awk -F, -f 15_niigata.awk > 15_niigata2.csv
# No.182〜？
url="https://www.pref.niigata.lg.jp/site/shingata-corona/256362838.html"
ruby ccc2.rb $url > 15_niigata3.csv
cat 15_niigata3.csv | awk -F, -f 15_niigata.awk > 15_niigata4.csv

#15 新潟市
url="https://www.city.niigata.lg.jp/smph/iryo/kenko/yobou_kansen/kansen/covid-19/hasseizyoukyou.html"
link=`curl -s $url | xmllint --html --xpath '//*//p[@class="filelink"]//a[@class="pdf"]/@href' - | cut -d\" -f 2`
url="https://www.city.niigata.lg.jp/$link"
curl -s -o 15_niigata_city.pdf $url
pdftotext -raw 15_niigata_city.pdf - | awk 'BEGIN{OFS=","}$1+0>0||$1=="№"{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' > 15_niigata_city.csv

#16 富山県
url="http://opendata.pref.toyama.jp/files/covid19/20200403/toyama_patients.csv"
curl -s -o 16_toyama.csv $url
link=`curl -s http://www.pref.toyama.jp/cms_sec/1205/kj00021798.html \
 | xmllint --html --xpath '//*[@id="file"]/ul/li[1]/a' - | iconv -f SJIS | cut -d\" -f 2`
curl -s -o 16_toyama2.xlsx $link
# 番号重複間違い？
# xlsx2csv 16_toyama2.xlsx > 16_toyama2.csv
xlsx2csv 16_toyama2.xlsx | sed 's/425,,44133,40代,男,富山市,会社員/426,,44133,40代,男,富山市,会社員/g' > 16_toyama2.csv

#17 石川県
url="https://www.pref.ishikawa.lg.jp/kansen/documents/170003_ishikawa_covid19_patients.csv"
curl -s $url | iconv -f SJIS > 17_ishikawa.csv
ruby 17_ishikawa.rb 17_ishikawa.csv > 17_ishikawa2.csv

#18 福井県
url="https://www.pref.fukui.lg.jp/doc/toukei-jouhou/covid-19_d/fil/covid19_patients.csv"
curl -s -o 18_fukui.csv $url
ruby 18_fukui.rb 18_fukui.csv > 18_fukui2.csv

# 19 山梨県
url="https://www.pref.yamanashi.jp/koucho/coronavirus/documents/yousei.xlsx"
curl -s -o 19_yamanashi.xlsx $url
xlsx2csv 19_yamanashi.xlsx > 19_yamanashi.csv
ruby 19_yamanashi.rb 19_yamanashi.csv > 19_yamanashi2.csv

#20 長野県
url="https://www.pref.nagano.lg.jp/hoken-shippei/kenko/kenko/kansensho/joho/documents/200000_nagano_covid19_patients.csv"
#url="https://www.pref.nagano.lg.jp/hoken-shippei/kenko/kenko/kansensho/joho/documents/200000_nagano_covid19_patients_2.csv"
curl -s $url | iconv -f SJIS  > 20_nagano.csv
awk -F, -f 20_nagano.awk 20_nagano.csv > 20_nagano3.csv

url="https://www.pref.nagano.lg.jp/kansensho-taisaku/happyou/allpressrelease.html"
ruby ccc2.rb $url > 20_nagano2.csv

url="https://www.pref.nagano.lg.jp/hoken-shippei/kenko/kenko/kansensho/joho/corona-doko.html#hasseijyokyo"
link=`curl -s $url | xmllint --html --xpath '//*[contains( ./text(),"新型コロナウイルス感染症の発生状況（PDF：")]/@href' - | cut -d\" -f 2`
curl -s -o 20_nagano.pdf "https://www.pref.nagano.lg.jp$link"

#21 岐阜県
#url="https://data.gifu-opendata.pref.gifu.lg.jp/dataset/4661bf9d-6f75-43fb-9d59-f02eb84bb6e3/resource/9c35ee55-a140-4cd8-a266-a74edf60aa80/download/210005gifucovid19patients.csv"
#curl -s $url | iconv -f SJIS > 21_gifu.csv

url="https://gifu-opendata.pref.gifu.lg.jp/dataset/c11223-001"
link=`curl -s $url | xmllint --html --xpath '//*[@id="dataset-resources"]/ul/li[1]/div/ul/li[2]/a/@href' - | cut -d\" -f 2`
curl -s $link | iconv -f SJIS > 21_gifu.csv

link=`curl -s "https://www.pref.gifu.lg.jp/site/covid19/26547.html" \
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Mobile Safari/537.36' \
  | grep "県内の患者一覧" | xmllint --html --xpath '//*/@href' - | cut -d\" -f 2`
curl -s -o 21_gifu.pdf "https://www.pref.gifu.lg.jp$link" 

#echo "県No,陽性判定日,年代,性別,都道府県,市町村,患者の状況
pdftotext -layout 21_gifu.pdf - | awk -f 21_gifu.awk > 21_gifu2.csv

# 岐阜市

link=`curl -s "https://www.city.gifu.lg.jp/item/44927.htm" \
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Mobile Safari/537.36' \
  | grep "市内の感染者発生状況一覧" | xmllint --html --xpath '//*/@href' - | cut -d\" -f 2`
curl -s -o 21_gifu_city.pdf https://www.city.gifu.lg.jp/$link \
  -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Mobile Safari/537.36'

pdftotext -raw -layout 21_gifu_city.pdf - | awk 'BEGIN {OFS=","}{print $1,$2,$3,$4,$5,$6,$7}' > 21_gifu_city.csv

#22 静岡県
url="https://opendata.pref.shizuoka.jp/dataset/8167/resource/46279/220001_shizuoka_covid19_patients.csv"
curl -s $url | iconv -f SJIS > 22_shizuoka.csv
cat 22_shizuoka.csv | awk -F, -f 22_shizuoka.awk > 22_shizuoka2.csv
#浜松市
url=`curl -s https://opendata.pref.shizuoka.jp/dataset/8113.html | grep "ダウンロード" | grep "patients.csv" | xmllint --html --xpath '//*//a/@data-url' - | cut -d\" -f 2`
curl -s $url | iconv -f SJIS > 22_hamamatsu_city.csv
# 静岡市
url=`curl -s https://dataset.city.shizuoka.jp/dataset/1589801834 | grep "title=\"静岡市新型コロナウイルス陽性者属性_csv\"" | tail -n 1 | xmllint --html --xpath '//*/a/@href' - | cut -d\" -f 2`
url=`curl -s "https://dataset.city.shizuoka.jp$url" | xmllint --html --xpath '//*[@id="content"]/div[3]/section/div[1]/p/a/@href' - | cut -d\" -f 2`
curl -s -o 22_shizuoka_city.csv $url

#23 愛知県
# 前月分までのPDF
link=`curl -s https://www.pref.aichi.jp/site/covid19-aichi/ | xmllint --html --xpath '//*[contains( ./text(),"10月まで [PDFファイル／")]/@href' - | cut -d\" -f 2`
url="https://www.pref.aichi.jp/$link"
curl -s -o 23_aichi1.pdf $url

# 当月分のPDF
link=`curl -s https://www.pref.aichi.jp/site/covid19-aichi/ | xmllint --html --xpath '//*[contains( ./text(),"11月 [PDFファイル／")]/@href' - | cut -d\" -f 2`
url="https://www.pref.aichi.jp/$link"
curl -s -o 23_aichi2.pdf $url

xlsx2csv 23_aichi1.xlsx > 23_aichi1.csv
xlsx2csv 23_aichi2.xlsx > 23_aichi2.csv
cat 23_aichi1.csv 23_aichi2.csv > 23_aichi.csv

(
  echo "No,発表日,年代,性別,国籍,住居地,接触状況,備考"
  ruby 23_aichi.rb 23_aichi1.csv
  ruby 23_aichi.rb 23_aichi2.csv
) > 23_aichi3.csv

#24 三重県
url="https://www.pref.mie.lg.jp/common/content/000896797.csv"
curl -s $url | iconv -f SJIS > 24_mie.csv
awk -F, -f 24_mie.awk 24_mie.csv > 24_mie2.csv

#url="https://www.pref.mie.lg.jp/YAKUMUS/HP/m0068000066_00011.htm"
#ruby ccc2.rb $url > 24_mie3.csv

#四日市市
url="https://www.city.yokkaichi.lg.jp/www/contents/1600832299733/index.html"
ruby ccc2.rb $url > 24_yokkaichi_city.csv
cut -d, -f 1,6 24_yokkaichi_city.csv | awk -F, 'NR==1{print "No,県No";}NR>1{gsub(/[^0-9]/,"",$1);printf "%d,%d\n",$1,$2}' > 24_yokkaichi_city_case_number.csv

#url="https://www.pref.mie.lg.jp/YAKUMUS/HP/m0068000066_00012.htm"
#ruby ccc2.rb $url >> 24_mie2.csv
#url="https://www.pref.mie.lg.jp/YAKUMUS/HP/m0068000066_00014.htm"
#ruby ccc2.rb $url >> 24_mie2.csv

#25 滋賀県
url="https://docs.google.com/spreadsheets/d/e/2PACX-1vQkSimAq6YKVyhqHy7wyEvL6-TeGmiNntRhP3iK5041mD900GYcjUKylMZIAJEIZzew9pCGfQ1AA-Ge/pub?gid=1551840287&single=true&output=csv"
curl -sL -o 25_shiga.csv $url 

# ruby ccc.rb shiga_table.html | tail -r > 25_shiga.csv
 #url="https://shiga-pref-org.github.io/covid19-data/data.json"
 #https://raw.githubusercontent.com/Shiga-pref-org/covid19-data/gh-pages/data.json
 #curl -s $url | jq -r '.patients.data[]|[."リリース日", ."居住地", ."年代", ."性別", ."退院", .date]|@csv' > 25_shiga.csv

#26 京都府
url="https://www.pref.kyoto.jp/kentai/corona/hassei1-50.html"
ruby ccc2.rb $url > 26_kyoto.csv

#url="https://www.pref.kyoto.jp/kentai/corona/documents/jyoukyo001-580.pdf"
url="https://www.pref.kyoto.jp/kentai/corona/hassei1-50.html"
#link=`curl -s $url | xmllint --html --xpath '//*[@id="tmp_contents"]/ul[2]/li/a/@href' - | cut -d\" -f 2`
link=`curl -s $url | xmllint --html --xpath '//*[contains(./text(),"府内感染状況　退院等（死亡退院・転院を含む）　1例目から950例目まで（PDF")]/@href' - | cut -d\" -f 2`
url="https://www.pref.kyoto.jp$link"
curl -s -o 26_kyoto.pdf $url
pdftotext -raw 26_kyoto.pdf - | awk 'BEGIN{OFS=","}{print $1,$2,$3,$4,$5,$6}' >> 26_kyoto.csv
#xlsx2csv 26_kyoto.xlsx -s 1 >> 26_kyoto.csv
#xlsx2csv 26_kyoto.xlsx -s 2 >> 26_kyoto.csv

url="https://raw.githubusercontent.com/stop-covid19-kyoto/covid19-kyoto/development/data/patients.json"
curl -s $url | jq -r '.data[]|[."No", ."居住地", ."年代と性別", ."退院", .date]|@csv' > 26_kyoto2.csv

#27 大阪府
url="http://www.pref.osaka.lg.jp/attach/23711/00346644/youseisyajyouhou.xlsx"
curl -s -o 27_osaka.xlsx $url
xlsx2csv 27_osaka.xlsx > 27_osaka.csv

#28 兵庫県
#https://web.pref.hyogo.lg.jp/kk03/corona_hasseijyokyo.html
#https://web.pref.hyogo.lg.jp/kk03/corona_kanjyajyokyo.html
#url="https://web.pref.hyogo.lg.jp/kk03/documents/corona-kanjajokyou.xlsx"
#url="https://web.pref.hyogo.lg.jp/kk03/documents/corona_kanjyajyokyo.xlsx"

link=`curl -s https://web.pref.hyogo.lg.jp/kk03/corona_hasseijyokyo.html | grep -e "新型コロナウイルスに感染した患者の状況" | grep -e "エクセル" | cut -d\" -f 2`
url="https://web.pref.hyogo.lg.jp$link"
curl -s -o 28_hyogo.xlsx $url
xlsx2csv 28_hyogo.xlsx | sed 's/^,//' > 28_hyogo.csv
#link=`curl -s "https://web.pref.hyogo.lg.jp/kk03/corona_kanjyajyokyo.html" | xmllint --html --xpath '//*[@id="tmp_contents"]/div[2]/p[4]/a' - | cut -d\" -f 2`
#url="https://web.pref.hyogo.lg.jp$link"
#curl -s -o 28_hyogo.xlsx $url
#xlsx2csv 28_hyogo.xlsx | sed 's/^,//' > 28_hyogo.csv

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

url="https://raw.githubusercontent.com/sys-cube/covid19/master/data/data.json"
( echo "居住地,年代,性別,退院,公表日"
  curl -s $url | jq -r '.patients.data[]|[."居住地", ."年代", ."性別", ."退院", .date]|@csv'
) > 30_wakayama2.csv

#31 鳥取県
url="https://www.pref.tottori.lg.jp/item/1207264.htm"
ruby ccc2.rb $url 2 | gawk -v FPAT='([^,]+)|(\"[^\"]+\")' -f 31_tottori.awk > 31_tottori.csv

#32 島根県
# jag japan
# 4/26,8/9,9/23発表分の確定日、発症日の一部おかしい
 (head -n 1 COVID-19.csv | cut -d, -f 1-22 && cat COVID-19.csv | cut -d, -f 1-22 | awk -F, '$10=="島根県"')  | awk -F, -f jag2.awk > 32_shimane.csv

# 島根県新型コロナウイルス感染症対策サイト[非公式]
# ※属性不明多い、数が１件おかしい
url="https://raw.githubusercontent.com/TaigaMikami/shimane-covid19/shimane/data/patients.json"
( echo "公表日,居住地,年代,性別"
  curl -s $url | jq -r '.patients.data[]|[.date, ."居住地", ."年代", ."性別"]|@csv' | sed 's/2020-04-9/2020-04-09/g'
) > 32_shimane2.csv

#33 岡山県
# Noが入っていない
url="http://www.okayama-opendata.jp/ckan/dataset/e6b3c1d2-2f1f-4735-b36e-e45d36d94761/resource/c6503ebc-b2e9-414c-aae7-7374f4801e21/download/kansenshashousaijouhou0420.csv"
curl -s $url | iconv -f SJIS > 33_okayama.csv

url="https://www.pref.okayama.jp/page/667843.html"
ruby ccc2.rb $url | sed y/０１２３４５６７８９/0123456789/ > 33_okayama2.csv

#34 広島県
url="https://www.pref.hiroshima.lg.jp/site/hcdc/covid19-kanjya.html"
ruby ccc2.rb $url > 34_hiroshima.csv

# 広島県新型コロナウイルス感染症データサイト[公式]
url="https://raw.githubusercontent.com/brickhouse-co-jp/covid19-hiropref/master/data/daily_positive_detail.json"
(
  echo "公表日,陽性者数,経路不明者数,経路判明者数"
  curl -s $url | jq -r '.data[]|[.diagnosed_date, .count, .missing_count, .reported_count]|@csv'
) > 34_hiroshima_daily_positive_detail.csv

url="https://raw.githubusercontent.com/brickhouse-co-jp/covid19-hiropref/master/data/daily_positive_detail-onset.json"
(
  echo "発症日,陽性者数"
  curl -s $url | jq -r '.data[]|[.diagnosed_date, .count]|@csv'
) > 34_hiroshima_daily_positive_detail-onset.csv

url="https://raw.githubusercontent.com/brickhouse-co-jp/covid19-hiropref/master/data/data.json"
(
  echo "公表日,居住地,年代"
  curl -s $url | jq -r '.patients.data[]|[.date, ."居住地", ."年代"]|@csv'
) > 34_hiroshima_patients.csv

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
 | xmllint --html --xpath '//table/tbody/tr[3]/td[4]//ul/li/a/@href' - \
 | cut -d\" -f 2 | sed -e 's/&amp;/\&/g'`
curl -s $link | iconv -f SJIS > 43_kumamoto.csv
if [ $? != 0 ] ; then
  curl -s $link > 43_kumamoto.csv
fi

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
