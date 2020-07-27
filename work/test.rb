require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'
require 'wareki'

url="https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000121431_00086.html"
doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
# report_date="2020-03-25"
# report_date=Date.parse("2021-03-23")

#wareki = doc.search(:time).text
#report_date = Date.parse(wareki)
#link = doc.css("a")
#puts link

doc.xpath("//div").each do |f|
# if not f.text.match(/（空港検疫）/) .nil? then
   puts f[:href]
# end
end 
 # puts f.index("（空港検疫）")
  #if (n == 100) then
  #puts f
#	end

  #if f.match(/空港検疫/) then
   #puts f[:href]
  #end
#end

#href=doc.css("a")[0][:href]
#puts href
#link = doc.search(:a)
#link.each do |a, link|
#  puts a[:href], a.text
#end

#doc.css('a').each do |anchor|
#  p anchor[:href]
#end
