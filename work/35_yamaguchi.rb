require 'csv'
csv = CSV.open(ARGV[0],'r')
csv.each_with_index do |line,n|
  report_date = Date.parse("2020/#{line[1]}")
  confirm_date = Date.parse("2020/#{line[2]}");
  age_class = line[3].gsub(/歳代/,"代")
  begin
    onset_date = Date.parse("2020/#{line[8]}")
  rescue => e
    onset_date = line[8]
  end
#  begin
#    hospitalization_date = Date.parse("2020/#{line[9]}")
#  rescue => e
#    hospitalization_date = line[9]
#  end
#  behavior = %Q["#{line[11]} #{line[12]}"]
#  remarks = %Q["#{line[13]}"]
remarks = %Q["#{line[9]}"]
puts [ line[0], report_date, confirm_date, age_class, line[4..7], 
#         onset_date, hospitalization_date, line[10], behavior, remarks ].join(",")
          onset_date, remarks ].join(",")
end
