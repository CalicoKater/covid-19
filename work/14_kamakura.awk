BEGIN{
  OFS=",";
}
NR==1{
  $1="city_case_number,perf_case_number";
  $3="age_class,gender";
  $9="remarks"
  print $0;
}
NR>1{
  if ($2 == "発表日" ) next;
  split($1,case_number, /（/);
  gsub(/[^0-9]/,"",case_number[1]);
  gsub(/[^0-9]/,"",case_number[2]);

  gsub(/令和2年/,"",$2);
  split($2,report_date,/月|日/);

  split($3, patient,/（|）/)
  gsub(/男性/,",男性",patient[1]);
  gsub(/男児/,",男児",patient[1]);
  gsub(/女性/,",女性",patient[1]);
  $9=patient[2];
printf "%d,%d,2020-%02d-%02d,", case_number[1],case_number[2],report_date[1],report_date[2];
print patient[1],$4,$5,$6,$7,$8,$9;
}

