{
  #s = substr( $2, 1, length($2) -12);
  if ( NR==1 ) s=0;
  p = $3+$4
  s = s + p
  #cnt = split( s, date ,"(令和|年|月|日)");
  split( substr( $2,1,length($2)-12), date ,"(令和|年|月|日)");
  
  #for ( i=1; i<=cnt; i++ ) print d[i]
  #y=date[2]+2018;
  #m=date[3];
  #d=date[4];

  #print cnt;
  printf "%s,%s/%02d/%02d,%s,%s, %s,%s \n", $1, date[2]+2018, date[3], date[4], $3,$4,p,s;

}

