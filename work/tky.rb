require 'nokogiri'
require 'csv'

html = File.open(ARGV[0])
doc = Nokogiri.parse(html,'utf-8')
table = doc.search(:table)

csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text.gsub(/\r|\n|/,'')}
    end
  end
}
#puts csv
puts '確定日, 確定日による陽性者数の推移（日別）, 確定日別による陽性者数の推移（累計）'
f=CSV.parse(csv, headers: false, liberal_parsing: {double_quote_outside_quote: true})
f.reverse.each do |line|
  puts [ line[0].strip, line[1].tr(',','').to_i, line[2].tr(',','').to_i ].join(",")
end
