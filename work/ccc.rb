require 'nokogiri'
require 'csv'

#html = File.open('newpage_10711.html')
html = File.open(ARGV[0])

doc = Nokogiri.parse(html)
table = doc.search(:table)
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text}
    end
  end
}
puts csv