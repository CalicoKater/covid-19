require 'csv'

CSV.foreach('a.csv') do |row|
  puts row
end
