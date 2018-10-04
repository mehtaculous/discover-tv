require "faker"

# Create Users
user = User.new(username: "sahil", email: "samehta91@gmail.com", password: "password")
user.skip_confirmation!
user.save!

10.times do |i|
  name = Faker::Name.first_name.downcase + "#{i+2}"
  user = User.new(
    username: name,
    email: name + "@gmail.com",
    password: "password",
  )
  user.skip_confirmation!
  user.save
end


puts "Seed finished"
puts "#{User.count} users created"
