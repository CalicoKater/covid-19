
#require 'csv'
#require 'json'

#csv = CSV.generate do |csv|
#  JSON.parse(File.open("positive_by_diagnosed.json").read).each do |hash|
#  #File.open("positive_by_diagnosed.json") do |line|
#    #puts line
#    csv << hash.values
#    #puts hash
#  end
#end
#puts csv

require 'csv'
require 'json'

#csv_string = CSV.generate do |csv|
#  JSON.parse(File.open("positive_by_diagnosed.json").read).each do |hash|
#    csv << hash.values
#  end
#end

#puts csv_string



csv_string = CSV.open('sample.csv','w') do |csv|
  JSON.parse(File.open("positive_by_diagnosed.json").read).each do |hash|
    csv << hash
  end
end