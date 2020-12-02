$1+0>=1{
  split($2,date,/月|日/);
  printf "%d,2020-%02d-%02d,%s,%s,", $1, date[1], date[2], $3, $4;
  if ( $5!="" ) {
    split($5,date,/月|日/);
    printf "2020-%02d-%02d", date[1], date[2];
  }
  print "";
}
