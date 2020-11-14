require 'csv'
require 'wareki'
csv = CSV.open(ARGV[0],'r', :row_sep => "\r\n")
csv.each_with_index do |line,n|
  if n > 0 then
    confirm_date = Date.parse("2020年#{line[4]}")
    begin
      if line[3].match(/\d{1,2}月\d{1,2}日/) then
        onset_date = Date.parse("2020年#{line[3]}")
      else 
        onset_date = line[3]
      end
    rescue => e
      onset_date = line[3]
    end
    puts [ line[0..2],onset_date, confirm_date, line[5..7] ].join(",").gsub(/\n/,"")
  else
    puts line.join(",").gsub(/\n/,"")
  end
end
