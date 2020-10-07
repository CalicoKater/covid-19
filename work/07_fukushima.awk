BEGIN{
  OFS=",";
}
NR==1{
  print $0
}
NR>1{
  gsub(/^　$/,"",$6)
  split($2, confirm_date, "月|日");
  printf "%d,%s-%02d-%02d,%s,%s,%s,%s\n", $1, "2020", confirm_date[1], confirm_date[2],$3,$4,$5,$6;
}