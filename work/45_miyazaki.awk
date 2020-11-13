BEGIN {
  OFS=",";
}
NR == 1 {
  #print $0;
  print "症例番号,判明日,年代,性別,居住地,濃厚接触者の状況,詳細,宮崎市症例番号";
}
NR > 1 {
   split($2,confirm_date,/月|日/);
   gsub(/ /,"",$3);
   gsub(/ /,"",$7);
  regidence = $5;
  city_case_number = "";
  if (match(regidence,/宮崎市/) > 0 ) {
    split(regidence, str,/\(|\)/);
    gsub(/ /,"", str[1]); regidence = str[1];
    gsub(/No.| |宮崎市/,"", str[2]);
    city_case_number = str[2];
  }
  printf "%d,2020-%02d-%02d,", $1, confirm_date[1], confirm_date[2];
  print $3, $4, regidence, $6, $7 ,city_case_number; 
}
