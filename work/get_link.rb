require 'open-uri'
require 'openssl'
require 'nokogiri'

url = "https://www.pref.kumamoto.jp/kiji_22038.html"

doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
doc.xpath('//*[@id="danraku1"]/div[11]/div[1]/div/table/tbody/tr[3]/td[4]/ul/ul/ul/ul/ul/ul/a').css('a').each do |anchor|
  puts anchor
end
