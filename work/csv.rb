require 'CSV'


if (File.exist?('data.csv')) then
    puts "csv file exist!"
else
    headers = ["pk","link","hash"]
    rows = [["0","www.google","abc"]]
    CSV.open("data.csv","w") do |csv|
    # csv_data = CSV.generate() do |csv|
       csv << headers
          rows.each do |row|
        csv << row
       end
    end
end
#puts csv_data