BEGIN {
  OFS=",";
}
NR==1{
  print "県No,陽性判定日,年代,性別,都道府県,市町村,患者の状況";
}
$1+0 > 0 && match($1, /代/) ==0 {
  split($2, confirm_date, /月|日/);
  printf "%d,2020-%02d-%02d,", $1,confirm_date[1], confirm_date[2];
  print $3,$4,$5,$6,$7;
}