# 新型コロナウイルス感染症の東京都の感染動向に関するファイル

東京都が発表している新型コロナウイルス感染症の陽性者数、確定日別陽性者数、発症日別陽性者数、
PCR検査及び抗原検査に関する検査数と陽性及び陰性者数のCSVファイルと生成するスクリプトファイル

## データソース

東京都 新型コロナウイルス感染症対策サイト https://stopcovid19.metro.tokyo.lg.jp/ の</br>
githubにあるデータ https://github.com/tokyo-metropolitan-gov/covid19/tree/development/data/</br>
東京都福祉保健局</br>
https://www.fukushihoken.metro.tokyo.lg.jp/index.html</br>
https://www.fukushihoken.metro.tokyo.lg.jp/iryo/kansen/shibou.html
## ファイルの説明
* 生成用スクリプト: tokyo_covid19.sh, tokyo_death_of_patient.sh, tokyo_death_of_patient.rb, tokyo_deaths_by_date_of_death.awk
- [tokyo_daily_positive_detail.csv](/tokyo_daily_positive_detail.csv) </br>
　→　報告日（公表日）ごとの陽性者数、接触歴等判明者数（濃厚接触者）、接触歴不明者数（経路不明者数）
- [tokyo_positive_by_confirmed.csv](/tokyo_positive_by_confirmed.csv)
　→　確定日ごとの陽性者数
- [tokyo_positive_rate.csv](/tokyo_positive_rate.csv)
　→　検査判明日ごとの陽性者数と陰性者数（PCR検査と抗原検査）
- [tokyo_positive_by_onset.csv](/tokyo_positive_by_onset.csv)
　→　発症日ごとの陽性者数
- [tokyo_positive_status.csv](/tokyo_positive_status.csv)
　→　日毎ごとの入院患者数と重症者数
- [tokyo_death_of_patient.csv](/tokyo_death_of_patient.csv)
　→　死亡者の発表詳細（診断日等）
- [tokyo_deaths_by_date_of_death.csv](/tokyo_deaths_by_date_of_death.csv)
　→　死亡日別による死亡者数

# 新型コロナウイルス感染症の空港検疫に関するファイル

厚生労働省が発表している新型コロナウイルス感染症の空港検疫に関する感染者数や
詳細情報、PCRテスト実施人数などをCSVファイルに出力するためのスクリプトとCSVファイルを置いています。

## データソース
厚生労働省／新型コロナウイルス感染症に関する報道発表資料（発生状況、国内の患者発生、海外の状況、その他
https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000121431_00086.html

## ファイルの説明
- [airport_quarantine2.csv](/airport_quarantine2.csv) </br>
 　→　日々の陽性者数（症状別）のデータ（CSV形式）
  *  重複事例は遡及してあります。</br>
  * 生成用スクリプト: airport\_quarantine.sh, airport\_quarantine.awk

- [airport\_quarantine\_description.html](/airport\_quarantine\_description.html)</br>
　→　陽性者の詳細情報のデータ（HTML形式）
  * 生成用スクリプト：airport_quarantine\_description.sh </br>
  * もともとテーブル書式がことなっていたものや画像だったりものはコピペして再生成しています。その他はもとのHTMLのtableタグから抽出したものです。
  * 重複事例（事例 61）はそのままです。

- [airport_pcr_test_daily.csv](/airport_pcr_test_daily.csv) </br>
　→　PCR実施人数のデータ（CSV形式）</br>
  * 生成用スクリプト：airport\_pcr\_test.sh, airport\_pcr\_test.awk
  * 重複事例以降の陽性者数は遡及してあります。</br>
  
- [airport_quarantine_arrived_summary.csv](/airport_quarantine_arrived_summary.csv) </br>
　→　到着日ベースの陽性者数のデータ（CSV形式）</br>
  * 生成用スクリプト：airport\_quarantine\_arrived.sh, airport\_quarantine\_arrived.awk
  * 重複事例は遡及してあります。到着日不明のものがありますので総件数が異なります。</br>
- [airport_quarantine_detail.csv](/airport_quarantine_detail.csv)</br>
→　陽性者の詳細情報のデータ（CSV形式）
  * 生成用スクリプト：airport_quarantine_detail.sh, airport_quarantine_detail.rb
  * もともとテーブル書式がことなっていたものや画像だったりものはコピペして再生成しています。その他はもとのHTMLのtableタグから抽出したものです。
  * 重複事例（事例 61）はそのままです。削除フラグが立っています。
  * html形式と異なるのは公表日付と到着日と削除フラグを追加しています。
  * その他、全角半角混在の内容や無駄な空白や改行は可能な限り取り除いています。
 
 ## データの更新
 不定期（調整中）
 
 ## ライセンス
 [MIT License](/LICENSE)
