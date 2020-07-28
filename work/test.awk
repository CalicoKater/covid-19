#!/usr/bin/gawk -f

BEGIN{
  RS="\r\n"
  FPAT="[^,]+|\"[^\"]+\""
  OFS= " --> "
}
{
  gsub(/\n/, "<LF>", $0);
  print $1, $2, $3
}
