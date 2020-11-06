BEGIN {
  OFS = ",";
}
NR == 1 {
  print "陽性者No,結果判明日,年代,性別,在住地等,再陽性,備考";
}
NR > 1 {
  relapse = ""; remarks = "";
  if ( $1 != "〃" ) split($1,confirm_date,/月|日/);
  gsub(/歳代/,"代", $3);
  if ($2 == "47(40と同一人物)") {
    remarks = $2; $2 = 47;
    relapse = "○";
  }
  if ($2 == "46(24と同一人物)") {
    remarks = $2; $2 = 46;
    relapse = "○";
  }
  printf "%d,2020-%02d-%02d,", $2, confirm_date[1], confirm_date[2];
  print $3, $4, $5, relapse, remarks;
}
