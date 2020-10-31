BEGIN{
  OFS=",";
}
$0=="No,年代,性別,居住地,確定日,現状,,"{
  print "No,年代,性別,居住地,確定日,現状,管轄";
  start_flg=1;
  next;
}
start_flg==1&&$1+0>0{
  printf "%d,%s,%s,%s,",$1, $2, $3,$4;
  #printf $5
  $5-=2;
  #print $5
  cmd="date -v+" $5 "d -j -f '%Y-%m-%d' '1900-01-01' +'%Y-%m-%d' | tr -d '\n'";
  #print cmd;
  # -j -f "%Y-%m-%d" "1900-01-01" +"%Y-%m-%d"
  system(cmd);
  printf ",%s,%s\n" ,$6, $8;
}
