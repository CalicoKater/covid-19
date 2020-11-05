BEGIN {
  OFS = ",";
}
NR==1{
  print $0;
}
NR>1 {
  split($4,report_date,/月|日/);
  printf "%s,%s,%s,2020-%02d-%02d,", $1, $2, $3, report_date[1], report_date[2];
  print $5,$6,$7,$8;
}