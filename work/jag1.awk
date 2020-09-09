#ヘッダ
NR == 1 {
print $0
}
# 通し, 年代, 性別, 確定日, 発症日, 受診都道府県, 受診都道府県コード
NR > 1 {
  #通し 保健所管内 （群馬県）スキップ
  if ($1+0 == 0) next;
  #空白トリミング
  gsub(/ /, "", $2) #年代
  gsub(/ /, "", $3) #性別
  gsub(/ /, "", $4) #確定日
  gsub(/ /, "", $5) #発症日
  gsub(/ /, "", $6) #受診都道府県
  gsub(/ /, "", $7) #受診都道府県コード
  #通し, 年代, 性別
  printf "%d,%s,%s,",$1, $2, $3 # seq, age, gender
  #確定日
  split($4,c_date,"/") # confirmed date
  printf "%04d-%02d-%02d,",c_date[3],c_date[1],c_date[2]
  #発症日
  if ($5 != "") {
    split($5,o_date,"/") ; # onset date
    # 石川県 発症日データ形式不具合
    if ($1 == 55933 && $5 == "8月16日") {
      printf "%04d-%02d-%02d,", 2020,8,16 }
    else {
      printf "%04d-%02d-%02d,", o_date[3],o_date[1],o_date[2]
    }
  } else printf "," ;
  #受診都道府県、受診都道府県コード
  printf "%s,%s\n",$6, $7 ; # prefectures
}
