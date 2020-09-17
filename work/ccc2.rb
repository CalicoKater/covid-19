require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'

#url = "https://www.mhlw.go.jp/stf/newpage_12674.html"
#url = "https://www.pref.akita.lg.jp/pages/archive/47957"
#url = ""
url = ARGV[0]

doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
#html = File.open('newpage_12674.html')

#doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
#doc = Nokogiri.parse(html)
table = doc.search(:table)
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    #if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text.gsub(/(\n|\r|\t|\u00A0)/, "")}
    #end
  end
}
puts csv