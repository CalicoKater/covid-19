require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'
require 'wareki'

url = ARGV[0]
# url = "https://www.mhlw.go.jp/stf/newpage_10445.html"
# url = "https://www.mhlw.go.jp/stf/newpage_10673.html" #重複事例
# url = "https://www.mhlw.go.jp/stf/newpage_12599.html"
# url = "https://www.mhlw.go.jp/stf/newpage_10352.html"
# url = "https://www.mhlw.go.jp/stf/newpage_10812.html"

# 公表日付の取得
doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)
# report_date="2020-03-25"
# report_date=Date.parse("2021-03-23")
wareki = doc.search(:time).text
report_date = Date.parse(wareki)

# 形式の異なるものを差し替え
case url
when "https://www.mhlw.go.jp/stf/newpage_09966.html"
  doc = Nokogiri::HTML.parse(File.read("no_1.html"))
when "https://www.mhlw.go.jp/stf/newpage_10190.html"
  doc = Nokogiri::HTML.parse(File.read("no_2.html"))
when "https://www.mhlw.go.jp/stf/newpage_10200.html"
  doc = Nokogiri::HTML.parse(File.read("no_3.html"))
when "https://www.mhlw.go.jp/stf/newpage_10205.html"
  doc = Nokogiri::HTML.parse(File.read("no_4_5.html"))
when "https://www.mhlw.go.jp/stf/newpage_10313.html"
  doc = Nokogiri::HTML.parse(File.read("no_6_7.html"))
when "https://www.mhlw.go.jp/stf/newpage_10812.html"
  doc = Nokogiri::HTML.parse(File.read("no_89_117.html"))
when "https://www.mhlw.go.jp/stf/newpage_12034.html"
  doc = Nokogiri::HTML.parse(File.read("no_280_282.html"))
end

# テーブル情報をcsvに書き換える
table = doc.search(:table).first
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text.gsub(/(\r|\t|\u00A0)/, "")}
    end
  end
}

# csvに追加の情報を追加、その他
f=CSV.parse(csv, headers: false, liberal_parsing: {double_quote_outside_quote: true})
f.each_with_index  do |line, n|
  del_flg = 0
  if ( line[0] == "61" ) then 
    del_flg = 1
  end

  # 到着日を取得
  if ( line[1].tr('（）／０-９','()/0-9').gsub( /[^0-9]/, "") == "" ) then
    arrival_date = ""
  else
    arrival_date = line[1].tr('（）／０-９','()/0-9')
    year = report_date.year
    month = arrival_date.split("(")[1].split("/")[0]
    day = arrival_date.split("/")[1].split(")")[0]
    #arrival_date = "2020-03-24"
    arrival_date = Date.parse("#{year}/#{month}/#{day}")
    # 年またぎの調整
    if (arrival_date > report_date ) then
      arrival_date = arrival_date << 12
    end
  end

  # csvストリームの書き出しと補正
  print report_date ,","    #公表日
  print line[0].tr('/０-９','/0-9').gsub(/\n/,"").strip, "," #事例
  print '"', line[1].tr('（）／０-９','()/0-9').strip, '"', "," #対応
  print '"', line[2].gsub(/\n/,"").tr('/０-９','/0-9').strip, '"', "," #年齢
  print '"', line[3].gsub(/\n/,"").strip, '"', "," #性別
  
  # 居住地の補正
  case line[4]
  when "茨城"
    print '"', "茨城県", '"', "," #居住地
  when "佐賀"
    print '"', "佐賀県", '"', "," #居住地
  else
    print '"', line[4].gsub(/\n|　/,"").strip, '"', "," #居住地
  end

  #行動歴の補正
  if ( line[5].size < 10 ) then
    print '"', line[5].gsub(/\n/,"").strip, '"', "," #行動歴
  else
    print '"', line[5], '"', "," #行動歴
  end
  if (line[6].size < 10) then
    print '"', line[6].gsub(/\n/,"").strip, '"', "," #症状
  else
    print '"', line[6], '"', "," #症状
  end
  
  print arrival_date, ","  # 到着日
  print del_flg, ","  # 削除フラグ
  print url # url
  puts
end
