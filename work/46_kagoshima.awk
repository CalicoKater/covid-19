BEGIN {
  OFS=",";
}
NR == 1 {
  print "症例番号,公表日,居住地,年代,性別,退院";
}
NR > 1 {
  if ( NF == 7 ) {
    case_number = $1;
    split($2,report_date,/月|日/);
    regidence = $3;
    age_group = $4;
    gender = $5;
    discharge = $7;
  }
  if ( NF < 7 ) {
    case_number = $1;
    regidence = $2;
    age_group = $3;
    gender = $4;
    if ( NF == 6 ) discharge = $6;
    if ( NF == 5 ) discharge = $5;
    if ( NF == 4 && $1 == 171 ) {
      regidence = "鹿児島市";
      age_group = "80代";
      gender = "女性";
      discharge = "〇";
    }
  }
  printf "%d,2020-%02d-%02d,", case_number, report_date[1], report_date[2];
  print regidence, age_group, gender, discharge;
}