require 'csv'

csv = CSV.open(ARGV[0],'r')
csv.each_with_index do |line,n|
  if n > 0 then
    report_date = Date.parse(line[3])
    onset_date = line[4]
    line[5] = line[5].gsub(/\n/,"") if not line[5].nil?
    line[7] = line[7].gsub(/\n/,"")
    if not onset_date.nil? and onset_date!="無症状" and onset_date!="非公表" then
      onset_date = Date.parse(onset_date) 
    end
    puts [ line[0..2], report_date, onset_date, line[5..7] ].join(",")
  else
    line[7] = line[7].gsub(/\n/,"")
    puts line.join(",")
  end
end
