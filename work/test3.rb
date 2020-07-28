require 'csv'
csv = CSV.open('airport_quarantine_detail.csv','r')
csv.each_with_index do |line,n|
  # header
  if (n > 0) then # header skip
    if ( line[1] != "61" ) then # Duplicate cases @ 2020-04-02 No.61
      if line[7].match(/無症状/).nil? then
        if (line[0] == "2020-03-15" || line[0] == "2020-03-18" || line[1] == "81" || line[1] == "82") then
          symptom = "無症状"
        else
          symptom="有症状"
        end
      else
        symptom="無症状"
      end
      # 報告日, 到着日
      puts [ line[0], line[8], symptom ].join(',')
    end
  end
end
