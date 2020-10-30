BEGIN{
  OFS=",";
}
NR==1{
  print "city_case_number,confirm_date,age_class,gender,regidence,remarks_2,remarks_3,remarks1";
}
$1+0>0{
  split($2,confirm_date,/月|日/);
  printf "%d,%04d-%02d-%02d,",$1,2020,confirm_date[1],confirm_date[2];
  print $3,$4,$5,$6,$7,$8;
}