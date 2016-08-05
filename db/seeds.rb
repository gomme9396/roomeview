require "roo"

xlsx = Roo::Excelx.new("xlsx/user.xlsx")
input = xlsx.parse(email: 'email', password:'password', password_confirmation:'password_confirmation')

input.each_with_index do |item, index|
  next if index ==0
  User.create(item)
end
