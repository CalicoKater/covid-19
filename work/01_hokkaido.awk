BEGIN{
  OFS=",";
}
  NR==1{
  print $0;
}
NR>1{
  gsub(/10未満/,"10歳未満",$8);
  gsub(/男$/,"男性",$9);

  # 無症状 http://www.pref.hokkaido.lg.jp/hf/kth/kak/pressrelease/hokkaido_z1017.pdf
  if ( $1 == 2513 && $6 == "エラー:502" ) $6 = "";
  # 無症状 http://www.pref.hokkaido.lg.jp/hf/kth/kak/pressrelease/hokkaido_z1028.pdf
  if ( $1 == 2925 && $6 == "エラー:502" ) $6 = "";
  # 無症状 http://www.pref.hokkaido.lg.jp/hf/kth/kak/pressrelease/hokkaido_z1105.pdf
  if ( $1 == 3554 && $6 == "エラー:502" ) $6 = "";

  print $0;
}