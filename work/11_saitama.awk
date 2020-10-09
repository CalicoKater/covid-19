BEGIN{
  OFS=",";
}
NR==1{
  gsub(/NO./,"No",$1);
  print $0;
}
NR>1{
  confirm_date=$2;
  gsub(/女児/,"女性",$4);
  if ( match(confirm_date,/重複|東京都発表|発生届取り下げ/) > 0 ) next;
  gsub(/\//,"-",$2);
  if ( confirm_date != $2 ) printf "%d,20%s,", $1, $2;
  else printf "%d,%s,", $1,$2;
  
  print $3,$4,$5;
}