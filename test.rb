require 'nokogiri'
require 'csv'
doc = Nokogiri::HTML.parse(File.read("airport_quarantine_description.html"))
table = doc.search(:table).first

csv_tmp = CSV.generate{ |csv|
  table.search(:tr).each do |tr|
    csv << tr.search("th, td").map{ |tag| tag.text }
  end
}
puts csv_tmp
