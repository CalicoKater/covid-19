BEGIN {
  OFS=",";
}
NR==1{
  print "死亡日,死亡者数,累計";
  next;
}
NF==4 {
  split($1,death_month,/令和|年|月/);
  year = death_month[2] + 2018;
  month = death_month[3];
  day = $2;
  daily_deaths = $3;
  total_deaths = $4;
  printf "%04d-%02d-%02d,", year, month, day;
  print daily_deaths, total_deaths;
}
NF<=3 {
  day = $1;
  daily_deaths = $2;
  total_deaths = $3;
  printf "%04d-%02d-%02d,", year, month, day;
  print daily_deaths, total_deaths;
}