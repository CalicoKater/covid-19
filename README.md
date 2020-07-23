# covid-19
厚生労働省が発表している新型コロナウイルス感染症の空港検疫に関する感染者数や
詳細情報、PCRテストなどをcsvファイルに出力するためのスクリプトとcsvファイルを置いています。

ファイルの説明：
- airport_quarantine2.csv
  →　日々の陽性者数（症状別）のデータ（csv形式）
　 -- 生成用スクリプト：airport_quarantine.sh, airport_quarantine.awk

- airport_quarantine_description.html
　→ 陽性者の詳細情報のデータ（html形式）
 ＊＊ 生成用スクリプト：airport_quarantine_description.sh
 
- airport_pcr_test_daily.csv
　→ PCR実施人数のデータ（csv形式）
 ** 生成用スクリプト：airport_quarantine.sh, airport_pcr_test.awk
