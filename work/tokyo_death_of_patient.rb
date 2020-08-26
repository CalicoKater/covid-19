require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'
require 'wareki'



#url = "https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/04/index.html"
url = "https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/04/30/15.html"


doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
table = doc.search(:table).first
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text.gsub(/(\r|\t|\u00A0)/, "")}
    end
  end
}

puts csv
