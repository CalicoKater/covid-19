BEGIN{
  OFS=",";
  flg=0;
}
NR==1{
  print $1,$2,$4,$5,$6;
}
NR>1{
  if ( $1 == 489 ) flg=1;
  $1+=flg;
  split($2, confirm_date,"月|日");
  printf "%d,2020-%02d-%02d,",$1, confirm_date[1],confirm_date[2];
  print $4,$5,$6;
}