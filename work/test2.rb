# encoding: utf-8
require 'net/http'
require 'uri'

url="https://www.mhlw.go.jp/stf/newpage_12644.html"
uri = URI.parse(url)
# response = Net::HTTP.get_response(uri)
doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
#txt = response.grep("（空港検疫）")
# response.code
# response.body


#str = Net::HTTP::get(uri)
#str.force_encoding("UTF-8")
#str = str.gsub(/\xEF\xBB\xBF|\xEF\xBF\xBE/,"")
# puts str
#str.scan(/（空港検疫）/) do |f|
#  puts f
#end
#puts str.text


#p str
#str.read do|f|
#  puts f.text
#end
#grep("（空港検疫）")
#puts response
#puts uri
#s='/（空港検疫）/'.force_encoding("UTF-8")
#s= req ~ /（空港検疫）/
#str = str.match(/空港検疫/)
#puts str.match(/（空港検疫）/)

#str.each do |line|
#  res = line.match(/（空港検疫）/)
#  puts res
#end
#.encode("UTF-8").
