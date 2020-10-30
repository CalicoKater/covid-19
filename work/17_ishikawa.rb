require 'csv'

csv = CSV.open(ARGV[0],'r')
csv.each_with_index do |line,n|
  if n > 0 then 
    report_date = Date.parse(line[4])
    age_class = line[6].gsub(/\n/,"")
    gender = line[7].gsub(/児/,"性").gsub(/　/,"")
    puts [ line[0..3], report_date, line[5], age_class, gender ].join(",")
  else
    puts line.join(",")
  end
end
