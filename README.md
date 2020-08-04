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
