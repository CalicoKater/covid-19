require 'open-uri'
require 'openssl'
require 'nokogiri'
require 'csv'
require 'wareki'
#date="2020-03-25"
# url = "https://www.mhlw.go.jp/stf/newpage_10445.html"
url = "https://www.mhlw.go.jp/stf/newpage_10673.html" #重複事例
doc = Nokogiri::HTML.parse(open(url,:ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE).open)

wareki = doc.search(:time).text
date = Date.parse(wareki)

table = doc.search(:table).first
csv = CSV.generate{ |csv|
  table.search(:tr).each_with_index do |tr, row|
    if ( row > 0 ) then
      csv << tr.search("th, td").map{|tag|tag.text.gsub(/(\r|\t)/, "")}
    end
    #print "," ,row
  end
  #puts csv.
}
#puts csv
#csv.table.each do |row|
#  puts row
#end

File.open('a.csv', 'wb'){|f| f.puts(csv)}
#f= CSV.parse(csv,liberal_parsing: {double_quote_outside_quote: true})
#ccc = CSV.open('a.csv','r', liberal_parsing: true)
#ccc.each do |row|
#  p row
#end
#tbl = CSV.table('a.csv')
#CSV.table("a.csv", headers: false, liberal_parsing: true) do |row|
#  puts row
#end

f=CSV.parse(csv, headers: false, liberal_parsing: {double_quote_outside_quote: true})

f.each_with_index  do |line, n|
  del_flg = 0
  if ( line[0] == "61" ) then 
    del_flg = 1
  end
  arrival_date = "2020-03-24"
  print date ,","    #公表日
  print line[0], "," #事例
  print '"', line[1], '"', "," #対応
  print line[2], "," #年齢
  print line[3], "," #性別
  print line[4], "," #居住地
  print '"', line[5], '"', "," #行動歴
  print '"', line[6], '"', "," #症状
  print arrival_date , ","  # 到着日
  print del_flg  # 削除フラグ
  puts
end
#CSV.open("a.csv", headers: false, liberal_parsing: true) do|row|
 #   p row
#end
#puts csv
#tbl = CSV.table(csv)

#tbl = csv.to_csv
#csv.to_csv.each do |row|
#  puts row
#end

# CSV.foreach(f, :headers => true, :force_quotes => true, :encoding => Encoding::UTF_8

#file_path = 'index_db.csv'
#File.open(file_path, 'wb'){|f| f.puts(tbl.to_csv)}

