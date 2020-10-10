require 'csv'
require 'wareki'
csv = CSV.open('12_chiba.csv','r')
csv.each_with_index do |line,n|
  if line[0] == "No." then
    puts [ line[0].gsub(/No./,"症例番号"), line[1], line[2], line[3], line[4], line[5], line[6] ].join(",")
  elsif line[0].to_i > 0 then
    #https://www.city.chiba.jp/hokenfukushi/iryoeisei/seisaku/covid-19/0828_cov_1.html
    line[6] = '8月27日' if line[0] == '2498'
    #https://www.pref.chiba.lg.jp/shippei/press/2020/documents/ncov2475-2497_m459-461.pdf
    line[4] = '患者 2417、2418、2419、2451、2452、2453、2454、2497、無症状452、461接触' if line[0] == '2496'
    line[4] = '患者 2418、2419、2451、2452、2454、2496、無症状452、461接触' if line[0] == '2497'
    onset_date = line[5]
    if not line[5].match(/月|日/).nil? then
      onset_date = Date.parse( "2020年" + line[5].to_s )
    end
    confirm_date = line[6]
    if not line[6].match(/月|日/).nil? then
      confirm_date = Date.parse( "2020年" + line[6].to_s )
    end
    puts [ line[0], line[1], line[2], line[3], "\"#{line[4].gsub(/\n|\r/,"")}\"", onset_date, confirm_date ].join(",")
  end
end
csv.close
