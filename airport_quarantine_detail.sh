fname="airport_quarantine_detail.csv"
echo 公表日, 事　例, 対　応（到着日）,年　齢,性　別,居住地,行動歴,症　状,到着日,削除フラグ,ソース > $fname
for url in `cat airport_quarantine_link_list.txt`; do ruby airport_quarantine_detail.rb $url; done >> $fname
