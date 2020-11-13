BEGIN {
  OFS=",";
}
NR == 1 {
  print $0;
}
NR > 1 {
   split($2,confirm_date,/月|日/);
   gsub(/ /,"",$3);   
   gsub(/ /,"",$7);
  regidence = $5;
  if (match(regidence,/宮崎市/) > 0 ) {
    split(regidence, str,/\(|\)/);
    gsub(/ /,"", str[1]); regidence = str[1];
  }
  printf "%d,2020-%02d-%02d,", $1, confirm_date[1], confirm_date[2];
  print $3, $4, regidence, $6, $7; 
}