require "poppler"

pdf_file=ARGV[0]


document = Poppler::Document.new(pdf_file)

puts document[0].get_text
puts document.count
pages = []

document.each do |page|
  #puts page.get_text
  rows = []
    # Separating a whole text
    t = page.text.split("\n")

    t.each do |s|
      # Formatting
      ary = s.split("\s\s")
      ary.delete_if { |str| str.nil? || str.empty? }
      ary.each(&:strip!)
      next if ary.empty?

      rows << ary
    end
    pages << rows
  end

  # Showing parsed data
  pages.each do |page|
    page.each { |rows| p rows }
    #page.each { |rows| puts rows[0] }
  end
