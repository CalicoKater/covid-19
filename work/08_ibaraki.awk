NR==1{
  print $0;
}
NR>1{
  split($2, report_date,"\/");
  gsub(/　/,"",$4);
  gsub(/男$/,"男性",$4);
  gsub(/女$/,"女性",$4);
  printf "%d,2020-%02d-%02d,%s,%s,%s,%s\n", $1, report_date[1],report_date[2],$3,$4,$5,$6;
}