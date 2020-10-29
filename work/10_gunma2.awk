BEGIN {
  OFS=",";
}
{
  gsub(/例目/, "", $1);
  split($2, confirm_date, /R|\./);
  #print NF;
  printf "%d,%04d-%02d-%02d,", $1, confirm_date[2]+2018, confirm_date[3], confirm_date[4];
  $7 = "\""$7"\"";
  print $3, $4, $5, $6, $7;
}
