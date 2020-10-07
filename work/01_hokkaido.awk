BEGIN{
  OFS=",";
}
  NR==1{
  print $0;
}
NR>1{
  gsub(/10未満/,"10歳未満",$8);
  gsub(/男$/,"男性",$9);
  print $0;
}