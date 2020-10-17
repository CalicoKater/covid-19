require 'csv'

csv = CSV.open(ARGV[0],'r')
csv.each_with_index do |line,n|
  if n > 0 then 
    report_date = Date.parse(line[4])
    age_class = line[6].gsub(/\n/,"")
    puts [ line[0..3], report_date, line[5], age_class, line[7] ].join(",")
  else
    puts line.join(",")
  end
end
