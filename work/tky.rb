#! ruby tky.rb abc.html > tky.csv
require 'nokogiri'
require 'csv'

html = File.open(ARGV[0])
doc = Nokogiri.parse(html,'utf-8')
table = doc.search(:table)

csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text.gsub(/\r|\n|/,'')}
    else
      # headers
      puts tr.search("th, td").map{|tag|tag.text}.join(",")
    end
  end
}
f=CSV.parse(csv, headers: false, liberal_parsing: {double_quote_outside_quote: true})
f.reverse.each do |line|
  puts [ line[0].strip, line[1].tr(',','').to_i, line[2].tr(',','').to_i ].join(",")
end
