BEGIN{
  OFS=",";
}
NR==1{
  print $0;
}
NR>1&&$1!=""{
  split($4, report_date, "\/");
  split($5, confirm_date, "\/");
  printf "%d,%s,%s,%04d-%02d-%02d,%04d-%02d-%02d,", $1, $2, $3, report_date[1], report_date[2],report_date[3],
  confirm_date[1],confirm_date[2],confirm_date[3];
  print $6, $7, $8;
}