#BEGIN {
#  OFS = ",";
#}
$0=="No,発表日,年代・性別,国籍,住居地,接触状況,備考" {
  print "No,発表日,年代,性別,国籍,住居地,接触状況,備考";
}
NR>2 {
  split($2,report_date,/月|日/);
  printf "%d,%04d-%02d-%02d,", $1, 2020, report_date[1], report_date[2];
  if ( match($3,/男性/) > 0 ) gender = "男性";
  if ( match($3,/女性/) > 0 ) gender = "女性";
  gsub(/女性|男性/, "", $3);
  printf "%s,%s,%s,%s,%s,%s\n", $3,gender,$4,$5,$6,$7;
}