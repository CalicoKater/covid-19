require 'csv'
require 'wareki'
csv = CSV.open(ARGV[0],'r')
csv.each_with_index do |line,n|
  if n > 1 then
    #puts line[1]
    report_date = Date.parse("2020年#{line[1]}")
    gender = line[2]
    age_class = gender.gsub(/女性|男性/,"")
    gender = '男性' if not line[2].match(/男性/).nil?
    gender = '女性' if not line[2].match(/女性/).nil?
    puts [ line[0], report_date, age_class, gender, line[3..4], "\"#{line[5]}\"",line[6] ].join(",")
  end
end
