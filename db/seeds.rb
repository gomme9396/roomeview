require "roo"
require 'csv'
  
xlsx = Roo::Excelx.new("xlsx/user.xlsx")
input = xlsx.parse(email: 'email', confirmation:'confirmation')

input.each_with_index do |item, index|
  next if index ==0
  User.create(item)
end

csv_text = File.read('xlsx/review.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Review.create!(row.to_hash)
  end

csv_text = File.read('xlsx/address.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Address.create!(row.to_hash)
  end
  
csv_text = File.read('xlsx/board.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Board.create!(row.to_hash)
  end
  
csv_text = File.read('xlsx/comment.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Comment.create!(row.to_hash)
  end  
# csv_text = File.read('xlsx/addressreview.csv')
#   csv = CSV.parse(csv_text, :headers => true)
#   csv.each do |row|
#     Addressreview.create!(row.to_hash)
#   end
