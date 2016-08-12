require "roo"
require 'csv'

xlsx = Roo::Excelx.new("xlsx/user.xlsx")
input = xlsx.parse(email: 'email', password:'password', password_confirmation:'password_confirmation')

input.each_with_index do |item, index|
  next if index ==0
  User.create(item)
end

csv_text = File.read('xlsx/address.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Address.create!(row.to_hash)
  end
  
csv_text = File.read('xlsx/addressreview.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    Addressreview.create!(row.to_hash)
  end
