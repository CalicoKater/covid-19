NR==1{
  print $0;
}
NR>1{
  gsub(/１０代/,"10代",$8);
  gsub(/年|月/,"-",$5); gsub(/日/,"",$5); #公表_年月日
  split($5, report_date, "-");
  gsub(/年|月/,"-",$6); gsub(/日/,"",$6); #判明_年月日
  split($6, confirm_date, "-");
  printf "%d,%06d,%s,%s,%s-%02d-%02d,%s-%02d-%02d,%s,%s,%s\n", $1,$2,$3,$4,
  report_date[1],report_date[2],report_date[3],
  confirm_date[1],confirm_date[2],confirm_date[3],
  $7,$8,$9;
}