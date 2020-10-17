require 'csv'

csv = CSV.open(ARGV[0],'r')
csv.each_with_index do |line,n|
  if n > 0 then 
    report_date = Date.parse(line[4])
    onset_date = line[5]
    if not onset_date.nil? then
      onset_date = Date.parse(line[5]) 
    end
    puts [ line[0..3], report_date, onset_date, line[6..14] ].join(",")
  else
    puts line.join(",")
  end
end
