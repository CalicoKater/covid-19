NR>1{
  split($3, confirm_date, "月|日");
  printf "%d,%d,%04d-%02d-%02d\n",$1,$2,"2020",confirm_date[1], confirm_date[2];
}
