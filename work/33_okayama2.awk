BEGIN {
  OFS = ",";
}
NR==1{
  print "症例番号,公表日,年代,性別,居住地,備考";
}
NR>1 {
  split($2,report_date,/月|日/);
  printf "%d,2020-%02d-%02d,", $1, report_date[1], report_date[2];
  print $3,$4,$5,$6;
}