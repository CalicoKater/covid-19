echo 公表日, 事　例, 対　応（到着日）,年　齢,性　別,居住地,行動歴,症　状,到着日,削除フラグ > test2.csv
for url in `cat airport_quarantine_link_list.txt`; do ruby gen_csv.rb $url; done >> test2.csv