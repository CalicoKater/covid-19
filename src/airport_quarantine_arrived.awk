{
  if ( NR == 1 ) cnt = 0 ;
  if ( $1 == "事例" || $1 == "事　例" ) ++cnt ;
  #print cnt, $1
  #if ( i
  #if ( $1 ~ /([0-9]/ ) print;
  if ( $1 !~ /.*熱/ && ($1 ~ /\([0-9]/ || $1 ~ /（[0-9]/ )) {
    #print cnt ",", $1;
    split( $1, date, "/");
    gsub( /[^0-9]/, "", date[1]);
    gsub( /[^0-9]/, "", date[2]);
    # 重複取り消し
    if (cnt == 15 && date[1] == "3" && date[2] == "29" ) next;
    
    printf "%s,%02d/%02d\n", cnt, date[1], date[2];
  }
  #break;
       #if (s != ""  ) {
  #s = match($1, "([0-9]" ) 
  #s = match($1, "(" ); 
  #if ( s > 0 ) {
  #  print cnt "," $1 ;

}

