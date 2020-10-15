BEGIN {
  OFS=",";
}
NR ==1 {
  gsub(/No./,"No",$1);
  print $0;
}
NR > 1 {
  split($2, confirm_date, /月|日/)
  gsub(/女$/,"女性",$4);
  gsub(/男$/,"男性",$4);

  printf "%d,2020-%02d-%02d,", $1, confirm_date[1], confirm_date[2];
  print $3, $4, $5, $6;
}
