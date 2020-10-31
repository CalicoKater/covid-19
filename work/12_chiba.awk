BEGIN {
  OFS = ",";
  print "No,年代,性別,居住地,区分,発症日,検査確定日";
}
NR>2 {
    if ( NR >= 33 && NR <=35 ) next;
    if ( NF == 7 ) {
      printf "\n";
      print $1,$2,$3,$4,"\""$5"\"",$6,$7;
      next;
    } else if ( NF > 1 ) { gsub(/ /,",",$0) }
      #if ( NF == 1 ) printf "\""$1"\",";
    printf $0;
}
  