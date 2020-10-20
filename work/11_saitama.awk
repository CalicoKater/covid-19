BEGIN{
  OFS=",";
}
NR==1{
  gsub(/NO./,"No",$1);
  print $0;
}
NR>1{
  gsub(/女児/,"女性",$4);
  if ( match($2,/重複|東京都発表|発生届取り下げ/) > 0 ) next;
  if ( $2 == "" || $2 == "調査中" ) printf "%d,%s,", $1, $2;
  else {
    split($2, confirm_date,/\//);
     printf "%d,%04d-%02d-%02d,", $1, confirm_date[1], confirm_date[2], confirm_date[3];
  }
  print $3,$4,$5;
}