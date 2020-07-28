require 'net/http'
require 'uri'
require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'
require 'wareki'

# 空港検疫のリンク先の取得
url="https://www.mhlw.go.jp/stf/seisakunitsuite/bunya/0000121431_00086.html"
uri = URI.parse(url)
response_get = Net::HTTP::get(uri)
response_get.force_encoding("UTF-8")
#str = str.gsub(/\xEF\xBB\xBF|\xEF\xBF\xBE/,"")
urls = Array.new
response_get.lines.each do |f|
  if not f.match(/（空港検疫）/).nil? then
    urls << f.match(%r{https?://[\w_.!*\/')(-]+}).to_a
  end
end
#urls.lines.each do |f|
urls.reverse.each_with_index do |url, n|

  # 公表日の取得
  uri = URI.parse(url[0])
  doc = Nokogiri::HTML.parse(open(uri,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
  wareki = doc.search(:time).text
  report_date = Date.parse(wareki) 

  a=0
  s=0
  # 症状別の症例件数の取得
  response_get = Net::HTTP::get(uri)
  response_get.force_encoding("UTF-8")
  response_get.lines.each do |f|
    if not f.match(/が報告されました/).nil? then
      msg = f.gsub(/<[^>]*>/,"")
      msg = msg.tr('０-９','0-9')
      an = msg.index("無症状病原体保有者")
      if ( not an.nil?  ) then
        a = msg[an .. -1].gsub(/[^0-9]/, "").to_i
      end
      sn = msg.index("患者")
      if (not sn.nil? ) then
        if (not an.nil? ) then
          s = msg[sn .. an - 1].gsub(/[^0-9]/,"").to_i
        else
          s = msg[sn .. -1].gsub(/[^0-9]/,"").to_i
        end
      end
    end
  end
  puts [ n+1, report_date.to_s, a, s, uri ].join(",")
end
