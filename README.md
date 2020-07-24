# 新型コロナの空港検疫に関するCSVファイル生成

厚生労働省が発表している新型コロナウイルス感染症の空港検疫に関する感染者数や
詳細情報、PCRテスト実施人数などのcsvファイルに出力するためのスクリプトとcsvファイルを置いています。

ファイルの説明：

- airport\_quarantine2.csv </br>
 　→　日々の陽性者数（症状別）のデータ（csv形式）
  *  重複事例は遡及してあります。</br>
  * 生成用スクリプト: airport\_quarantine.sh, airport\_quarantine.awk

- airport\_quarantine\_description.html </br>
　→　陽性者の詳細情報のデータ（html形式）
  * 生成用スクリプト：airport_quarantine\_description.sh </br>
  * もともとテーブル書式がことなっていたものや画像だったりものはコピペして再生成しています。その他はもとのHTMLのtableタグから抽出したものです。
  * 重複事例（事例 61）はそのままです。

- airport\_pcr\_test\_daily.csv </br>
　→　PCR実施人数のデータ（csv形式）</br>
  * 生成用スクリプト：airport\_pcr\_test.sh, airport\_pcr\_test.awk
  * 重複事例以降の陽性者数は遡及してあります。</br>
  
- airport\_quarantine\_arrived\_summary.csv </br>
　→　到着日ベースの陽性者数のデータ（csv形式）</br>
  * 生成用スクリプト：airport\_quarantine\_arrived.sh, airport\_quarantine\_arrived.awk
  * 重複事例は遡及してあります。到着日不明のものがありますので総件数が異なります。</br>