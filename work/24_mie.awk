BEGIN{
  OFS=",";
}
NR==1 {
  print $0;
}
NR>1 {
  split($5,report_date,/\//);
  printf "%d,%s,%s,%s,%04d-%02d-%02d,", $1,$2,$3,$4,report_date[1],report_date[2],report_date[3];
  print $6,$7,$8,$9,$10,$11,$12,$13,$14,$15;
}
