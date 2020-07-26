{
  if ( NR==1) sum=0;
  sum=sum+$3+$4;
  #s=substr($2,1,length($2)-12);
  split(substr($2,1,length($2)-12),date,"(令和|年|月|日)");
  #print s;
  #print date[1];
  #print date[2];
  #print date[3];
  #print date[4];
  printf "%s/%02d/%02d,%s,%s\n",date[2]+2018,date[3],date[4],sum,$3+$4;
}

