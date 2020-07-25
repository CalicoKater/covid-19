require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'
d="2020/03/25"
doc = Nokogiri::HTML.parse(open("https://www.mhlw.go.jp/stf/newpage_10445.html",:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
table = doc.search(:table).first
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{ |tag| tag.text} << ["2020/03/25"]
    end
  end
}

puts csv




file_path = 'index_db.csv'
File.open(file_path, 'wb'){|f| f.puts(tbl.to_csv)}




,[2020/03/25]]  

#old_csv << csv

csv.each do | info |
 csv << info
end
 
puts csv

puts old_csv
