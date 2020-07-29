require 'net/http'
require 'uri'
require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'
require 'wareki'

require 'httpclient'

url="https://www.mhlw.go.jp/stf/newpage_12674.html"
uri = URI.parse(url)
#html=open(uri).read
#puts "open-uri: ", Digest::MD5.hexdigest(html)

response = Net::HTTP::get(uri)
puts "net/http: ", Digest::MD5.hexdigest(response)


#html = HTTPClient.get_content(uri)
#puts "httpclient: ", Digest::MD5.hexdigest(html)
