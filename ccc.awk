{
  # awk -v f_key=$p_key
  if ( f_key > 5 ) {
    if ( NR == 1 ) c = 0;
    if ( length($1) != 0 ) {
      ++c;
      if ( c == 1 ) printf $1 "," f_key;
      if ( c > 1 ) printf "," "\"" $1 "\"";

      # 帰国日不明
      if ( (f_key == 6 || f_key == 7) && c == 2 ) printf "," ;
    } else {
      if ( c > 0 ) print "";
      c=0;
    }
  }
}

