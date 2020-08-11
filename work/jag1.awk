NR == 1 {
print $0
}

NR > 1 {
  split($3,c_date,"/") # confirmed date
  printf "%s,%s,",$1, $2 # age, gender
  printf "%04d-%02d-%02d,", c_date[3],c_date[1],c_date[2]
  if ($4 != "") {
    split($4,o_date,"/") ; # onset date
    printf "%04d-%02d-%02d,", o_date[3],o_date[1],o_date[2] ;
    } else printf "," ;
  print $5 ; # prefectures
}
