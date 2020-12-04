#ruby https://www.mhlw.go.jp/stf/newpage_12674.html
#ruby https://www.pref.kagawa.lg.jp/content/etc/subsite/kansenshoujouhou/kansen/se9si9200517102553.shtml 3
require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'

#url = "https://www.mhlw.go.jp/stf/newpage_12674.html"
#url = "https://www.pref.akita.lg.jp/pages/archive/47957"
user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.67 Safari/537.36'
url = ARGV[0]
uri = URI.parse(url)
#doc = Nokogiri::HTML.parse(open(uri,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
doc = Nokogiri::HTML.parse(URI.open(uri,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE, "User-Agent" => user_agent).open)
#html = File.open('newpage_12674.html')
#doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
#doc = Nokogiri.parse(html)
if ARGV.size() == 1 then
  table = doc.search(:table)
else
  table = doc.search(:table)[ARGV[1].to_i]
end
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    #if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text.gsub(/(\n|\r|\t|\u00A0)/, "").strip}
    #end
  end
}
puts csv