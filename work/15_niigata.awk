BEGIN{
  OFS=",";
}
NR==1{
  gsub(/患者 No./,"症例番号,",$1);
  gsub(/※報道発表資料へリンク/,"新潟市症例番号",$1);
  print $0;
}
NR>1{
  if ($2 == "欠番" || $9 ~ /発生届取り下げ/ ) next;
  if ( match($2,/新潟市/) > 0 ) {
    gsub(/[^0-9]/,"",$2);
  } else $2 = "";
  gsub(/歳代/,"代",$4);
  split($3, confirm_date,/月|日/);
  printf "%d,%s,2020-%02d-%02d,", $1, $2, confirm_date[1],confirm_date[2];
  print $4, $5,$6,$7,$8,$9;
}