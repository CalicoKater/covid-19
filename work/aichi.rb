require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'

url = "https://www.pref.aichi.jp/site/covid19-aichi/list550-1516.html"

doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
doc.xpath('//*[@id="main_body"]/div/div/ul').css('a').each do |anchor|
  if anchor.text.include?('新型コロナウイルス感染症患者の発生について') then
    link="https://www.pref.aichi.jp" + anchor[:href]
    puts [ link, anchor.text ].join(",")
  end
end
