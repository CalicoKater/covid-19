NR==2{
  print $0;
}
$0+0>0{
  printf "%d,%d,%s,%s,%s,", $1,$2,$3,$4,$5;
  $6-=2;
  cmd="date -v+" $6 "d -j -f '%Y-%m-%d' '1900-01-01' +'%Y-%m-%d' | tr -d '\n'";
  system(cmd);
  printf ",";
  gsub(/ |　/,"",$7);
  if ($7 != "") {
    $7-=2;
    cmd="date -v+" $7 "d -j -f '%Y-%m-%d' '1900-01-01' +'%Y-%m-%d' | tr -d '\n'";
    system(cmd);
  } 
  printf ",%s\n", $8;
}
$0==",,,,,43973,43990,"{
  print "18,18,30代,男性,宇都宮,2020-05-22,2020-06-08,接待を伴う飲食あり　※宇都宮市5例目";
 
}