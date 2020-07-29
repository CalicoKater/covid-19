require 'nokogiri'
require 'csv'

html = File.open('abc.html')
doc = Nokogiri.parse(html)
table = doc.search(:table)
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text}
    end
  end
}
#puts csv
puts '確定日, 確定日による陽性者数の推移（日別）, 確定日別による陽性者数の推移（累計）'
f=CSV.parse(csv, headers: false, liberal_parsing: {double_quote_outside_quote: true})
f.reverse.each do |line|
  puts [ line[0], line[1].tr(',','').to_i, line[2].tr(',','').to_i ].join(",")
end
