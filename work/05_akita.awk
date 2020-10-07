NR==1{
  print $0
}
NR>1{
  gsub(/例目/,"",$1);
  gsub(/日/,"",$2);
  split($2, confirm_date,"月");
  gsub(/歳代/,"代",$3);
   #gsub(/歳未満/,"代未満",$3);
  printf "%d,%s-%02d-%02d,%s,%s,%s,%s,%s,%s\n", $1,
    "2020", confirm_date[1], confirm_date[2],
    $3, $4, $5,$6,$7,$8;
}