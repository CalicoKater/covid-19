NR==1{
  print $0
}
NR>1{
  gsub(/第|例目/,"",$1)
  #gsub(/歳未満/,"代未満",$2);
  split($5,confirm_date,/令和|年|月|日/);
  printf "%d,%s,%s,%s,%04d-%02d-%02d,%s\n", $1, $2, $3, $4,
    2018 + confirm_date[2], confirm_date[3], confirm_date[4],$6;
}