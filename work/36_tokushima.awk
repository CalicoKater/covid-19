{
  gsub(/例目/, "", $1);
  split($2,confirm_date,/月|日/);
  printf "%d,2020-%02d-%02d,%s,%s\n", $1, confirm_date[1], confirm_date[2],$3, $4;
}
