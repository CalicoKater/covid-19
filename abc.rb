require 'open-uri'  
require 'openssl'
require 'nokogiri'
require 'csv'
require 'wareki'

d="2020/03/25"
doc = Nokogiri::HTML.parse(open("https://www.mhlw.go.jp/stf/newpage_10445.html",:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
date=doc.search(:time).text
#puts date
#y=date.split("令和")[1].split("年")
#puts y[0].to_i+2018
#m=date.split("年")[1].split("月")
#puts m[0].to_i
#d=date.split("月")[1].split("日")
#puts d[0].to_i

#require 'wareki'
puts Date.parse(date)

