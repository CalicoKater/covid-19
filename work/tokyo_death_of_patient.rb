#
#
#(
#for url in `cat death_rep_list.txt`; do 
#  #echo $url
#  ruby tokyo_death_of_patient.rb $url
#done
#) >tokyo_death_of_patient.csv


require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'
require 'wareki'
require 'net/http'
require 'uri'



#url = "https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/04/index.html"
url = "https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/04/30/15.html"
url = "https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/04/01/21.html"
#url = ARGV[0]
uri = URI.parse(url)

response_get = Net::HTTP::get(uri)
response_get.force_encoding("UTF-8")
press_date = Array.new
response_get.lines.each do |f|
  if not f.match(/press_date/).nil? then
    press_date = Date.parse(f.gsub(/[^0-9]/,""))
  end
end

puts press_date

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
