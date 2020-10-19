BEGIN{
  OFS=",";
}
NR == 2 {
  print $0;
}
NR>=3 {
  split($5, confirm_date,/\// );
  printf "%d,%s,%s,%s,%04d-%02d-%02d,", $1,$2,$3,$4,confirm_date[1], confirm_date[2], confirm_date[3];
  print $6,$7,$8,$9,$10,$11,$12,$13,$14,$15;
}
