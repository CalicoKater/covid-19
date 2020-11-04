BEGIN {
  OFS = ",";
}
NR==1 {
  print $0;
}
NR>1 && NF==5 {
  split($2,confirm_date,/月|日/);
}
NR>1{
  case_number = $1;
  age_group = $(NF-2);
  gender = $(NF-1);
  gsub(/女/,"女性",gender);
  sub(/男/,"男性",gender);
  regidence = $(NF);
  printf "%d,2020-%02d-%02d,", case_number, confirm_date[1], confirm_date[2];
  print age_group, gender, regidence;
}