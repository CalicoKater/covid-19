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
#url = "https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/04/30/15.html"
#url = "https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/04/01/21.html"
#url="https://www.metro.tokyo.lg.jp/tosei/hodohappyo/press/2020/05/21/15.html"
url = ARGV[0]
uri = URI.parse(url)
response_get = Net::HTTP::get(uri)
response_get.force_encoding("UTF-8")
press_date = Array.new
response_get.lines.each do |f|
  if not f.match(/press_date/).nil? then
    press_date = Date.parse(f.gsub(/[^0-9]/,""))
  end
end

#puts press_date
doc = Nokogiri::HTML.parse(URI.open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
table = doc.search(:table).first
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text.strip.gsub(/―|-|\u00A0/,'')}
    end
  end
}
# 5/21追加修正
if press_date == Date.parse("2020-05-21") then
  table = doc.search(:table)[1]
  csv << CSV.generate{ |csv|
    table.search(:tr).each_with_index do |tr, row|
      if ( row > 0 ) then
        csv << tr.search("th, td").map{|tag|tag.text.strip.gsub(/―|-|\u00A0/,'')}
      end
    end
  }  
end

#doc.close
#puts csv
f = CSV.parse(csv, headers: false, liberal_parsing: {double_quote_outside_quote: true})
f.each_with_index  do |line, n|
  # ＊＊＊ 年末年始 要修正（プレス日付と比較して加減算）＊＊＊
  #confirm_date = Date.parse("２０２０年" + line[4])
  #death_date = Date.parse("２０２０年" +line[5])
  #プレス日付, 枝番, 年代, 性別, 居住地, 発症日, 診断日, 死亡日, ソース
  #puts [ press_date, line[0], line[1], line[2], line[3],,confirm_date, death_date, url ].join(",")
  puts [ press_date, line[0], line[1], line[2], line[3], "", line[4], line[5], url ].join(",")
end